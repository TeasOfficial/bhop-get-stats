/**
 *	Yaw Diff plugin made by @normalamron
 *  Discord: nbfl
 *	GitHub: https://github.com/normalamron
 */

#define YAWS_UPDATE_INTERVAL 10

static int g_iTickNumber;

void ShowYaws_Tick()
{
	if(!g_hEnabledShowyaws.BoolValue)
	{
		return;
	}

	g_iTickNumber++;

	if(g_iTickNumber % YAWS_UPDATE_INTERVAL != 0)
	{
		return;
	}

	g_iTickNumber = 0;

	for(int i = 1; i <= MaxClients; i++)
	{
		if(!IsValidClient(i))
		{
			continue;
		}

		float vVel[3];
    	GetEntPropVector(i, Prop_Data, "m_vecVelocity", vVel);
    	float speed2D = SquareRoot(vVel[0] * vVel[0] + vVel[1] * vVel[1]);

		if (speed2D < 10.0) continue;

		float velocityYaw = RadToDeg(ArcTangent2(vVel[1], vVel[0]));

		float eyeAngles[3];
    	GetClientEyeAngles(i, eyeAngles);
    	float viewYaw = eyeAngles[1];

		float deltaYaw = -NormalizeAngle(velocityYaw - viewYaw);

		const int maxOffset = 10;
    	int barOffset = Clamp(RoundToNearest((deltaYaw / 180.0) * maxOffset), -10, 10);
    	int cursorPos = maxOffset + barOffset;

		char sVisual[32] = "";
    	for (int j = 0; j < 21; j++)
    	{
    	    sVisual[j] = (j == cursorPos) ? '|' : '-';
    	}

		for(int j = -1; j < g_iSpecListCurrentFrame[i]; j++)
		{
			int messageTarget = j == -1 ? i:g_iSpecList[i][j];

			if(!(g_iSettings[messageTarget][Bools] & SHOWYAWS_ENABLED) || !BgsIsValidPlayer(messageTarget))
			{
				continue;
			}
			char sMessage[128];
    		Format(sMessage, sizeof(sMessage), "Yaw Δ: %.1f°\n[%s]", deltaYaw, sVisual);

			int speedColorIdx;
			if(deltaYaw < 30 || deltaYaw > -30){
				speedColorIdx = GainBad;
			}

			if(deltaYaw < 10 || deltaYaw > -10)
			{
				speedColorIdx = GainMeh;
			}
    		
			if(deltaYaw > 90 || deltaYaw < -90)
			{
				speedColorIdx = GainReallyBad;
			}

			BgsDisplayHud(messageTarget, g_fCacheHudPositions[messageTarget][Speedometer], g_iBstatColors[g_iSettings[messageTarget][speedColorIdx]], 0.2, GetDynamicChannel(4), false, sMessage);
		}
	}
}
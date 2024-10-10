#include <registryFunction.h>
#include <subRecord.h>
#include <menuFtype.h>
#include <dbDefs.h>
#include <stdio.h>
#include <math.h>
#include <errlog.h>
#include <recGbl.h>
#include <alarm.h>
#include <epicsExport.h>

int scurve_subDebug = 0;

/* For non-linear analog output voltage range 0.375 to 2.842 volts */
double scurve_seg1(double a, double b, double c, double d, double e, double f, double x)
{
	double y;
	y = a + b * x + c * pow(x, 2) + d * pow(x, 3) + e * pow(x, 4) + f * pow(x, 5);
	return y;
}

/* For non-linear analog output voltage range 2.842 to 4.945 volts */
double scurve_seg2(double a, double b, double c, double d, double e, double f, double x)
{
	double y;
	y = (a + c * x + e * pow(x, 2))/(1 + b * x + d * pow(x, 2) + f * pow(x, 3));
	return y;
}

/* For non-linear analog output voltage range 4.945 to 5.659 volts */
double scurve_seg3(double a, double b, double c, double d, double x)
{
	double y;
	y = (a + c * x)/(1 + b * x + d * pow(x, 2));
	return y;
}

static long subSCurveInit(subRecord* psub) 
{
	if (scurve_subDebug)
        	printf("Record %s called subSCurveInit(%p)\n",psub->name, (void*) psub);

	return 0; 
}

static long subSCurveCalc(subRecord *psub) 
{

	if (scurve_subDebug)
        	printf("Record %s called subSCurveCalc(%p)\n",psub->name, (void*) psub);

	/* Coefficients for Analog output voltage range of 0.375 to 2.842 */
	double range1_a = -0.02585;
	double range1_b = 0.03767;
	double range1_c = 0.04563;
	double range1_d = 0.1151;
	double range1_e = -0.04158;
	double range1_f = 0.008738;
	/* Coefficients for Analog output voltage range of 2.842 to 4.945 */
	double range2_a = 0.1031;
	double range2_b = -0.3986;
	double range2_c = -0.02322;
	double range2_d = 0.07438;
	double range2_e = 0.07229;
	double range2_f = -0.006866;
	/* Coefficients for Analog output voltage range of 4.945 to 5.659 */
	double range3_a = 100.624;
	double range3_b = -0.37679;
	double range3_c = -20.5623;
	double range3_d = 0.0348656;

	double raw_value = psub->a;

	if(raw_value < 0.375)
		recGblSetSevr(psub, UDF_ALARM, INVALID_ALARM);
	else if (raw_value >= 0.375 && raw_value < 2.842)
		psub->val = scurve_seg1(range1_a, range1_b, range1_c, range1_d, range1_e, range1_f, raw_value);
 	else if (raw_value >= 2.842 && raw_value < 4.945)
		psub->val = scurve_seg2(range2_a, range2_b, range2_c, range2_d, range2_e, range2_f, raw_value);
	else if (raw_value >= 4.945 && raw_value <= 5.659)
		psub->val = scurve_seg3(range3_a, range3_b, range3_c, range3_d, raw_value);
	else
		psub->val = 1000;

	if (scurve_subDebug)
		printf("value is %f, severity is %d\n", psub->val, psub->sevr);

	return 0;
}


/* Register these symbols for use by IOC code: */
epicsExportAddress(int, scurve_subDebug);
epicsRegisterFunction(subSCurveInit);
epicsRegisterFunction(subSCurveCalc);


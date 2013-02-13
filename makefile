
# Please update these before use

GRADING_RM = ./grading_rm.sh
GRADING_CAL = ./grading_cal.sh
GRADING_DIST = ./grading_dist.sh
GRADING_TAR = ./grading_tar.sh
GRADING_DIST_CLIENT = ./grading_dist_client.sh
GRADING_REPORT = ./grading_report.sh

HW = hw01
REPO = ./cs112-hw01
AWK = ./grading_cal.awk
DIST = ./hw01-userid.txt
GROUPBY = 27
DIST_CLIENT = ./HW02GradingClient.java
PART = 

all:
	

dist:
	${GRADING_DIST} ${HW} ${DIST} ${REPO} ${PART}
	${GRADING_DIST_CLIENT} ${REPO} ${DIST_CLIENT}

tar:
	${GRADING_TAR} ${HW} ${GROUPBY} ${REPO}
	
cal:
	${GRADING_CAL} ${HW} ${AWK} ${REPO} ${PART}

report:
	${GRADING_REPORT} ${HW} ${REPO} ${PART}

clean:
	${GRADING_RM} ${HW} ${REPO} ${PART}

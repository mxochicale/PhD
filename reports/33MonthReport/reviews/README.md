Progress Review Form for Postgraduate Researchers GRS3
---

# Part B
To be completed by the PGR (and given to the Lead supervisor two weeks
before the Progress Review)

################################################################################   
## Thesis title
Automatic Classification of Movement Variability in Human-Humanoid Interaction

################################################################################   
## (1)
Please report below the work you have completed since last Progress Review OR,
if this is your initial Progress Review, the work you have completed since you
began your current research programme. Please list your publications since the
start of your research course.

The progress of my research endeavours for my PhD has been mainly related to
to the improvement of conduction of experiments and the implementation of algorithms
for data analysis, both of which are described below:

* 1. CONDUCTION OF EXPERIMENT(S)
I conducted an experiment of Human-Humanoid Imitation in a face-to-face activity
where simple arm movements (horizontal and vertical movements) were imitated by
twenty participants. Four NeMEMsi wearable inertial sensors were used to collect
data from the participants and NAO (the humanoid robot).

* 2. DATA ANALYSIS
2.1. TIDE UP
Data from the NeMEMsi inertial sensors were synchronised and tidied up using R and MATLAB.
The R package "data.table" has been used to tide up data from the 20 participants whom
perform four activities: 1) horizontal movement at normal speed; 2) horizontal
movement at faster speed; 3) vertical movement at normal speed; and 4) vertical
movement at faster speed. Similarly, the whole data has been interpolated to get the
same vector length per activity.
2.2. POSTPROCESSING
Savitzky Golay and low-pass butterworth filters were applied to smooth the data and
separate the low frequency components of the acceleration and angular acceleration sensors.
Additionally, the first and second derivative were applied to the data.


* PUBLICATION(S):
  * [1]
MP Xochicale, C Baber and M Oussalah
Understanding movement variability of simplistic gestures using an inertial sensor
PerDis '16 Proceedings of the 5th ACM International Symposium on Pervasive Displays,
June, 2016,Oulu, Finland.

  * [2]
MP Xochicale, C Baber and M Oussalah
Analysis of the Movement Variability in Dance Activities Using Wearable Sensors
Conference Paper (PDF Available) · October 2016 with 170 Reads
The 2nd International Symposium on Wearable Robotics, October 2016, Segovia, Spain

  * [3]
MP Xochicale, C Baber and M Oussalah
Towards the Quantification of Human-Robot Imitation Using Wearable Inertial Sensors
The 12th Annual Conference on Human-Robot Interaction (HRI2017), March 2017, Vienna, Austria



################################################################################   
## (2)
Please give details of research training you have undertaken since the last
Progress Review, OR, if this is your initial Progress Review, since you began
your current research programme.

Since November 2015, I have been booking one or two appointments per month at the
"one to one English tutorials" which are very helpful to discuss and find issues in
the following areas of the use of English language: grammar, vocabulary,
academic style and organisation.

################################################################################   
## (3)
Please list the research training you have yet to undertake.
* None
################################################################################   
## (4)
Is there is a financial cost to this future training (e.g. registration fees
for a conference)?
Yes [ * ] No  [ ]

If YES, please confirm that you have identified funds to cover these costs
or have agreed a plan with your Supervisory team to apply in a timely manner
for the necessary funds.

Professor C. Baber has fully covered the expenses for the previous conferences.
In the remaining time for my PhD, I am planning to submit two conference papers
which can be covered either by Professor C. Baber or by Dr. M Oussalah or in worst
case by myself.

################################################################################   
## (5)
Please give an outline of your planned work for the next semester.

* 1. May 2017 -
1.1. Present advances of my work at the second forum of talented Mexicans
"Innovation Match MX 2017".
1.2. Implement the smooth and derivative data functions to the data of the 20 participants.
1.3. Run a pilot experiment using OpenFace where the head pose estimation is used to
have a better understanding about the relationship of movement variability
between the complexity of arm movements and the level of attention per participant.
* 2. June 2017 -  
2.1. Implement dynamic invariants' algorithms such as: the lyapunov algorithms, poincare maps,
recurrence maps in order to analyse data of the 20 participants.
2.2. Create synthetic data for periodic, quasi periodic and chaotic time series
and apply the dynamic invariants' algorithms.
2.3. Using the data of the 20 participants, a comparison will be performed of
techniques in time-domain, frequency-domain and nonlinear dynamics.
* 3. July 2017 -
3.1. Polish the manuscript to the Human Movement Science Journal and send a draft version
to Chris Baber and Mourad Oussalah for their acute comments.
3.2. Polish the manuscript.
3.3. Submit manuscript in the last week of July.
3.4. Design experiment and collect data for the Human-Robot Interaction HRI2018 conference
(rate of acceptance: 24%).
* 4. August 2017 -
4.1. Data analysis and generation of results for the 8-page paper submission to the HRI2018.
4.2. Send draft paper to Chris Baber, Mourad Oussalah and Aaron Sloman.
* 5. September 2017
Polish and submit a full paper to HRI2018 (deadline October 6, 2017)
* 6. October 2017.
6.1. Install tensorflow on Ubuntu 16 x64
6.2. Implement examples of convolution neural networks in tensorflow
6.3 Implement examples of time series with the use of convolutional neural networks.


################################################################################   
## (6)
Please give a timetable for your work between now and the end of your maximum
period of registration (i.e. deadline for submission of your thesis), or
attach an existing plan.

[attach image for third year]
[attach image for fourth year]

################################################################################   
## (7)
If applicable, please add your comments about the progress you have made since
this form was last completed and how it compares with your predictions then.
Please include details of any problems encountered and action taken to mitigate
these.
--
################################################################################   
## (8)
Have you considered and discussed with your supervisor relevant ethical issues
connected to your research, in particular whether ethical approval is required?

Yes, we were discussing the ethical issues of my last experiment with people
of different age and stage of health. Particularly, the performance of activities
to observer both the fatigue or boredom effects.

################################################################################   
## (9)
Have you updated your DNA (GRS1A) in light of activity undertaken since the
last progress review?

No.

################################################################################   
## (10)
Please consider the impact of your research and how this impact is demonstrated
to both specialist and non-specialist audiences (e.g. publications,
  conference presentations, public engagement and outreach activities).

From the start of my PhD, I believe that my research outcomes are far from being impactful.
Nonetheless, I would like to note that I have been presenting insightful results towards
the automatic quantification of movement variability in human-humanoid interaction.
With this in mind, my work has been accepted in three conferences of which I presented
them in two of them where I successfully communicated the lines of my research to
renowned researchers, PI, postdocs and PhDs students. I have also participated
two times in the internal research poster conference of University of Birmingham
as well in two symposiums of Mexican students in the UK where I managed to speak to
non-specialist audiences. I have also made some public engagement at the Open Days of
University of Birmingham. Last but not least, I am going to volunteer at the Science
Museum in the Robots exhibition twice a month from May 2017 to September 2017.

################################################################################   
## (11)
Do you know who your Mentor is and do you have their contact details if you
need to consult with them?
Yes [ * ]  No  [ ]

If NO, please contact your School PGR administrator in order to obtain your
Mentor’s name and contact details.

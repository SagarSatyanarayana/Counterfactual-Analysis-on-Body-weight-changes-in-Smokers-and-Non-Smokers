				Quantile Regression Analysis

Objectives – To test the effects of quitting smoking on body weight changes at different quantile levels 0.1, 0.5 and 0.9 using quantile regression models.

Data and methods – 
The data used was NHANES I Epidemiologic follow-up study which was a collection of medical and behavioral information during an initial examination and again at follow-studies after approximately one decade.
The data contains 12 variables with 1,282 subjects who kept smoking and 464 subjects who quit at the time of follow-up interview.
The 12 variables are – 
•	Activity   = 'Level of daily activity with values in {0,1,2}'
•	Age        = 'Age in 1971'
•	BaseWeight = 'Weight in kilograms at the 1971 interview'
•	Change     = 'Body Weight Change'
•	Education  = 'Level of education with values in {0,1,2,3,4}'
•	Exercise   = 'Level of recreational exercise with values in {0,1,2}'
•	Perday     = 'Number of cigarettes smoked per day in 1971'
•	Quit       = '1 for quitting smoking; 0 otherwise'
•	Race       = '0 for white; 1 otherwise'
•	Sex        = '0 for male; 1 for female'
•	Weight     = 'Weight in kilograms at the follow-up interview'
•	YearsSmoke = 'Number of years an individual has smoked';

 “Change” is the response variable which indicates the change in the Body weight at the initial examination and the follow-up examination. The other variables are independent.
  
Counterfactual analysis used to test the effect of Quit smoking on body weight. The data was divided into two groups – one group with people who had stopped smoking and was used as a test data (TestObs) and the other group with people who continued smoking at the time of follow-up, this was used as a training data (TrainObs).
Cumulative distribution functions for both the test data and train data were derived. A quantile regression model was derived for a sequence of taus(quantiles) ranging from 0.05 to 0.95 was derived (TestFit). This model was used on the test data and the cumulative distribution function for the same was also derived.
When the three cumulative distribution function is plotted, it gives the corresponding response values at all quantile levels. The difference in the three curves is used to interpret the effect of Quit smoking on the body weight.


Results- 

 

The above plot shows the cumulative probability for the three model groups
The quantile prediction for the three quantile levels –

Quantile level=0.1	min 	median 	mean	max
Kept smoking	-14.9671	-6.3016	-6.5073	-0.6063
Quit Smoking	-18.418	-4.624	-4.847	1.929
Test Fit	-14.9671	-6.3016	-6.5073	-0.6063


Quantile level=0.5	min 	median 	mean	max
Kept smoking	-3.0148	2.0682	1.9976	5.8321
Quit Smoking	-1.87	4.058	3.949	8.325
Test Fit	-3.0148	2.0682	1.9976	5.8321


Quantile level=0.9	min 	median 	mean	max
Kept smoking	2.808	9.804	9.717	15.623
Quit Smoking	4.682	15.167	14.981	22.28
Test Fit	2.808	9.804	9.717	15.623

Explanation, conclusion and discussion of the analysis results

From the cumulative distribution graph, it can be said that – There is no difference among the three groups in terms of body weight “Change” until the quantile level of 0.2.  After quantile level 0.2, the quit smoking group shows to have more positive change in weight than the group that continued smoking. 
The test-fit is used in the counterfactual analysis. The test-fit seems to show lesser change in body weight than the other two group and at higher quantile levels equals the keep smoking group. As the test group was trained using the ‘keep-smoking’ data and fitted on the ‘quit-smoking’ group, it can be said that the more positive body-weight change observed in the ‘quit-smoking’ group is because of quitting smoking.
This can be used to imply that quitting smoking has an effect of increase in body-weight ( this is more evident at higher quantile levels – strengthening the above statement).

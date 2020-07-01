#load Rcpp files for all supporting functions
Rcpp::sourceCpp('BAGEL.cpp')
source('BAGEL.R', echo=FALSE)
D = 5; #the number of drugs
Q=3; #the number of depression items
S=5; #the number of covaraites
N=100; #the number of patients
H=10
# generate simulated data 
simulated_data <- generate_simulate_data(D, Q, S, N, H)
# get MCMC 
Burnin = 20
Niter = 100
thin = 5
mcmc <- main_mcmc(Data=simulated_data, Burnin,Niter,thin)
# predicttion
x_new <- simulated_data$X[10,]
z_new <- simulated_data$Z[10,]
depression_prob_predict(mcmc, z_new, x_new)
 
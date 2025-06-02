% Paramètres de l'exemple
N = 4;             % Nombre d'antennes
d_lambda = 0.1;           % Distance entre les antennes divisé par la longueur d'onde de la porteuse
angles_deg = [0,20];  % Angles d'incidence des K sources en degrés
L = 20000;           % Nombre d'échantillons
Fe_f0 = 20;         % Nombre d'échantillons par période
delta_f_f0 = 0.1;% écart fréquentielle divisé par la fréquence centrale     
K = length(angles_deg); % Nombre de sources
sigma_b = 0; %ecart type du bruit blanc capté par les antennes


% Générer les signaux reçus par les antennes

x = sim_2_d(angles_deg(1),angles_deg(2),Fe_f0,d_lambda,delta_f_f0,L,N);
x = env(x,1/Fe_f0,1);
x_cycle = env(x_cycle,N/Fe_f0,1);
R_g = estimator_correlation_matrix_corrcoef(x);

% Appliquer la méthode MUSIC pour estimer les directions d'arrivée
R_avg = (R_g(:,:,1)+R_g(:,:,1)')./2;
doa_estimates = apply_MUSIC(R_avg, K, d_lambda);

% Affichage des résultats (DOA estimées)
disp('Estimations des Directions d''Arrivée (DOA) :');
disp(doa_estimates);

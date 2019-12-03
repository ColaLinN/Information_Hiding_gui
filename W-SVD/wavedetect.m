function [ corr_coef, corr_DCTcoef] = wavedetect( test, original, seed, wavelet, level, alpha, ratio) 
dataoriginal = imread( original) ; 
datatest = imread( test) ; 
dataoriginal = double( dataoriginal) /255; 
datatest = double( datatest) /65535; 
% ����ע�������������ĸ, ������ͼ���ļ���ʽ�йص� 
dataoriginal = dataoriginal(:,:, 1) ; 
datatest = datatest(:,:, 1 ) ; 
% ��ȡ����ˮӡ��ͼ���С����Ƶϵ�� 
[ watermarkimagergb, watermarkimage, waterCA, watermark2, correlationU, correlationV] = water( original, 'detect_extra_generate.png', seed, wavelet, level, alpha, ratio) ;
% ��ȡ����ͼ���С����Ƶϵ�� 
[ C, S] = wavedec2 ( datatest, level, wavelet) ; 
CA_test = appcoef2( C, S, wavelet, level) ; 
% ��ȡԭʼͼ���С����Ƶϵ�� 
[ C, S] = wavedec2 ( dataoriginal, level, wavelet) ;
realCA = appcoef2( C, S, wavelet, level) ; 
% ��������ˮӡ 
realwatermark = waterCA-realCA; testwatermark = CA_test-realCA;
% ���������ֵ 
corr_coef = trace ( realwatermark'* testwatermark) /( norm( realwatermark, 'fro') * norm( testwatermark, 'fro') ) ; 
% DCT ϵ���Ƚ� 
DCTrealwatermark = dct2( waterCA-realCA) ; 
DCTtestwatermark = dct2 ( CA_test-realCA) ;
DCTrealwatermark = DCTrealwatermark ( 1: min ( 32 , max ( size ( DCTrealwatermark) ) ) , 1:min( 32, max( size( DCTrealwatermark) ) ) ) ;
DCTtestwatermark = DCTtestwatermark ( 1:min ( 32, max ( size ( DCTtestwatermark) ) ) , 1:min( 32, max( size( DCTtestwatermark) ) ) ) ; 
DCTrealwatermark( 1, 1) = 0; DCTtestwatermark( 1, 1) = 0; corr_DCTcoef = trace ( DCTrealwatermark'* DCTtestwatermark) /( norm( DCTrealwatermark, 'fro') * norm( DCTtestwatermark, 'fro') ) ;
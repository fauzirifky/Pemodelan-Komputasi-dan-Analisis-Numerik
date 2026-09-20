function M = metrik_regresi(y,yhat)
%METRIK_REGRESI MSE, RMSE, MAPE(%), and R2 with undefined cases guarded.
y=y(:);yhat=yhat(:);
if numel(y)~=numel(yhat) || isempty(y) || ~all(isfinite([y;yhat]))
    error('Data dan prediksi harus finite, sama panjang, tidak kosong.');
end
r=y-yhat; SSE=sum(r.^2); MSE=mean(r.^2);RMSE=sqrt(MSE);
if any(y==0), MAPE=NaN; else, MAPE=100*mean(abs(r./y));end
SST=sum((y-mean(y)).^2);
if SST==0, R2=NaN;else,R2=1-SSE/SST;end
M=struct('MSE',MSE,'RMSE',RMSE,'MAPE',MAPE,'R2',R2,'SSE',SSE);
end

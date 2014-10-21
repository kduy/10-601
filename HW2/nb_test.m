function [Pred_nb] = nb_test(model, Xtest)

Pred_Y0 = Xtest.*(ones(size(Xtest,1),1)*log10(model.PW_Y0));
Pred_Y1 = Xtest.*(ones(size(Xtest,1),1)*log10(model.PW_Y1));
Compare = [sum(Pred_Y0,2)+log10(model.PY0) sum(Pred_Y1,2)+log10(model.PY1)];
[junk Pred_nb] = max(Compare,[],2);
Pred_nb = Pred_nb-1;

end


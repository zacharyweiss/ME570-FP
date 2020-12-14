function hypLogLikely = preempt_score(hypotheses,observations,remainingHyp,idxObs)
% must return log likelyhoods in order defined by remainingHyp (L_order in
% preempt_path.m)
    coeff = [0.5 0.5 0 0];
    pd = makedist('Beta','a',4,'b',4);
    nRHyp = numel(remainingHyp);
    likely = @(c,obs,hyp) coeff(c)*(cdf(pd,hyp)-cdf(pd,obs));
    
    hypLogLikely = zeros(1,nRHyp);
    for iRHyp = 1:nRHyp
        iHyp = hypotheses(remainingHyp(iRHyp));
        lStr = likely(1,observations(idxObs).str,observations(iHyp==[observations.idxHyp]).str);
        lCol = likely(1,observations(idxObs).col,observations(iHyp==[observations.idxHyp]).col);
        lDGoal = likely(1,observations(idxObs).dGoal,observations(iHyp==[observations.idxHyp]).dGoal);
        lNNode = likely(1,observations(idxObs).nNode,observations(iHyp==[observations.idxHyp]).nNode);
        
        if lStr+lCol+lDGoal+lNNode>=0
            hypLogLikely(iRHyp) = log(lStr+lCol+lDGoal+lNNode);
        elseif lStr+lCol+lDGoal+lNNode<0
            hypLogLikely(iRHyp) = -log(-lStr-lCol-lDGoal-lNNode);
        else
            error('LogLikelihood error')
        end
    end
end


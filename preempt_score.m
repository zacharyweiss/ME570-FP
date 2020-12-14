function hypLogLikely = preempt_score(hypotheses,observations,remainingHyp,idxObs)
% must return log likelyhoods in order defined by remainingHyp (L_order in
% preempt_path.m)
    coeff = [.25 .25 .25 .25];
    pd = makedist('Beta','a',1,'b',1);
    nRHyp = numel(remainingHyp);
    likely = @(c,obs,hyp) coeff(c)*(cdf(pd,hyp)-cdf(pd,obs));
    
    hypLogLikely = zeros(1,nRHyp);
    for iRHyp = 1:nRHyp
        iHyp = hypotheses(remainingHyp(iRHyp));
        lStr = likely(1,observations(idxObs).str,observations(iHyp==[observations.idxHyp]).str);
        lCol = likely(2,observations(idxObs).col,observations(iHyp==[observations.idxHyp]).col);
        lDGoal = likely(3,observations(idxObs).dGoal,observations(iHyp==[observations.idxHyp]).dGoal);
        lNNode = likely(4,observations(idxObs).nNode,observations(iHyp==[observations.idxHyp]).nNode);
        
        if lStr+lCol+lDGoal+lNNode>=0
            %hypLogLikely(iRHyp) = log(lStr+lCol+lDGoal+lNNode)+1;
            hypLogLikely(iRHyp) = lStr+lCol+lDGoal+lNNode;
        elseif lStr+lCol+lDGoal+lNNode<0
            %hypLogLikely(iRHyp) = 0;
            %hypLogLikely(iRHyp) = -log(-lStr-lCol-lDGoal-lNNode);
            hypLogLikely(iRHyp) = lStr+lCol+lDGoal+lNNode;
        else
            error('LogLikelihood error')
        end
    end
end


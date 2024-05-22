# HMM CDR Detection

This is a script written by Justin Chan(credited below), with a few bug fixes, performance changes, and functionality improvements. One of the major ones is the ability to identify CDR transtions which are regions flanking CDRs where methylation gradually increases or decreases.

```
usage: HMMCDRReferenceDetection.py [-h] 
                                [-m Runs with Initial CDR Estimate File]    
                                [-l Learning Rate for the Viterbi Learning.] 
                                [-p bed file containing modified CPG site probabilities]
                                [-s bed file containing estimate CDR Regions] 
                                [-o output prefix]  
                                [-aa Probability from next CpG position being in a CDR given current CpG position in CDR]  
                                [-ab Probability from next CpG position not being in a CDR given current CpG position in CDR]   
                                [-bb Probability from next CpG position not being in a CDR given current CpG position not in CDR]   
                                [-ba Probability from next CpG position being in a CDR given current CpG position not in CDR]    
                                [-ax Probability of current CpG position is methylated given current CpG position in CDR]  
                                [-ay Probability of current CpG position is not methylated given current CpG position in CDR]   
                                [-bx Probability of current CpG position is methylated given current CpG position not in CDR]  
                                [-by Probability of current CpG position is not methylated given current CpG position not in CDR]   
```

### Contributions
Thank you Justin Chan for writing the framework for this HMM! [github](https://github.com/Justinmchan408/HMMCDRDetection)


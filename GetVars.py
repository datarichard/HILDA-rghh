# coding: utf-8
def GetVars(flist, codetuple):
    ''' Return a new df with values of the hilda variable from every wave'''

    for fpath in flist:
        # Read all the variable names and labels in the current wave
        fdictionary = pd.read_stata(fpath, iterator = True)
        vnames = fdictionary.varlist
        
        # Get the variable names we want in the current wave
        varwavenames = [var for var in vnames if var.endswith(codetuple)]
        varwavenames.insert(0, "xwaveid")
        
        # Store the waveid (for recording below)
        waveid = varwavenames[-1][0]
        
        # Extract the variables we want
        df = pd.read_stata(fpath,
                           index_col = "xwaveid",
                           columns = varwavenames,
                           convert_categoricals = False
                           )
        
        # Relabel the columns to remove the waveid from each variable
        df.columns = df.columns.str.replace(r"^[a-p]", "")
        
        # Record the waveid in its own variable
        df = df.assign(wave = waveid)
        
        # Concatenate the new dataframe with the results so far
        try:
            joined = pd.concat([joined, df])
            
        except NameError:
                joined = df.copy()
                                
    return joined

import pandas as pd

import _utils as utils

# read in latest snapshot, get only ceds and message results
x = pd.read_csv(utils.pth + 'v25.csv')
lower = x.REGION == x.REGION.str.lower()  # rm isos
x = x[~lower]
x = x[(x.SCENARIO == 'CEDS') | (x.MODEL.str.contains('MESSAGE'))]

# you have to dump to csv first because read_data only reads files for now
x.to_csv('results_v25.csv', index=False)
y = utils.read_data('results_v25')
z = utils.read_data('45-no-overrides_harmonized', ext='xlsx')
z.columns = [str(_) for _ in z.columns]
pd.concat([y, z]).to_csv('results.csv', index=False)

import sys
import pandas as pd
sys.path.append('../../../iiasa/ceds_harmonization_analysis/')
import utils

x = utils.read_data('45-no-overrides_harmonized', ext='xlsx')
y = utils.read_data(
    'MESSAGE-GLOBIOM_SSP2-45-SPA2-V25_unharmonized_harmonized', ext='xlsx')
z = pd.read_csv('read_data_just_ceds.csv')

pd.concat([x, y, z]).to_csv('results.csv', index=False)

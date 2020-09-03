# easyEC-GEM
Extraction, manipulation, summarization, and visualization of E.C. numbers from genome scale metabolic models

## Extraction
`src/extract.sh` assumes that [EMBL-GEMs](https://github.com/cdanielmachado/embl_gems) are present in /models folder, and will generate the folder ecfiles with an ecfile (.ec) containing a unique list of E.C. numbers for each GEM.

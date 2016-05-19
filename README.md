##SFE-ToDo

Description: For the PhD students required to transfer Quantlets of SFE from Quantnet 1.0 to Quantnet 2.0.

__This repository includes:__
- Every Q has to be in its own subfolder in the repository, e.g. [SFEReturns](https://github.com/QuantLet/SFE-ToDo/tree/master/SFEReturns)
- Styleguide and FAQ - [General Rules](https://github.com/QuantLet/Styleguide-and-FAQ)

__Workflow:__
- Find the corresponding Q of your project 
- Clone to your local folder
- Add matlab file to the Q with corresponding Metainfo fields.
- Make sure the matlab file is formatted as required by the styleguide.
- Check the Metainfo.txt whether it can be parsed with yaml and additionally check
	- 5 keywords at least 
	- description has more than 10 words
	- use CheckMetainfo.R to check for yaml convertibility
- Create a pull request with the changes you made. Make sure only desired changes are comitted.



__Q respository:__

Every QuantLet Repository consists of four elementary parts (Readme.md is not included because it can be automatically provided to your repository by Q team):
- input, e.g. dataset
- code
- output, e.g. figure
- Metainfo.txt 

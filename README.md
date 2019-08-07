# Batching-Zip-Files
This Bash file takes a directory containing a large dataset (>20) and partitions it into multiple and indpendent zip files.

The difference between this bash file and **splitting** zip files is that the latter partitions a dataset into multiple **dependent** datasets where the user must download all zip files at once to unzip the dataset.

This arose out of the need to transfer small partitions of a dataset into a limited-storage server. Therefore, once the zip files have been created, the user can treat them as smaller independent zip files.

## Requirements
For the bash file to execute correctly, the following criterias must be met
1. Bash file is stored and executed on directory containing dataset
2. User must specify the desired size of each partition.
3. Dataset must be of the format of:
```linux
Aaron_Boyd
  Aaron_Boyd_0001.jpg
  Aaron_Boyd_0002.jpg
  ...

Aaron_Evans
  Aaron_Evans_0001.jpg
  Aaron_Evans_0002.jpg
  ...
  
Aaron_Hornback
  Aaron_Hornback_0001.jpg
  Aaron_Hornback_0002.jpg
  ...
 
 Aaron_Lewis
  Aaron_Lewis_0001.jpg
  Aaron_Lewis_0002.jpg 
  ...
  ```
That's it! I would love to hear feedback on how this file could be improved for a more user-friendly experience.


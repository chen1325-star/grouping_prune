###  seperate: 
Each level of the models is trained separately, with no weight sharing.

###  sort:
Loaded the official pretrained model, sorting all the splats with the v_important score. In each folder, the point cloud model contains same number of splats of the pretrained model. According to the number of splats for the model at each level, take the corresponding number of splats from the front. This is our baseline for sorting.

###  training:
Progressive training. Each level of the models are trained with weight sharing. In each folder, the point cloud model contains all 180k splats, same as sorting, taking the first 45k,90k,135k,180k splats are the 4 levels model we need. 
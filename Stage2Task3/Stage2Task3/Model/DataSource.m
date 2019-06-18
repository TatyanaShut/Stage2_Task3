//
//  DataSource.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 18.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "DataSource.h"
#import "ViewController.h"

@implementation DataSource
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.urlArray = [[NSArray alloc] init];
        
         self.urlArray =  @[@"http://www.designerspics.com/wp-content/uploads/2014/07/fallen_leaves_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/06/shirts_free_photos.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/11/gifts_golder_wrapper_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/10/to_do_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/05/united_states_capitol_large_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/11/notebook_pen_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/pizza_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/12/xmas_decoration_2_free_photo.jpg",@"https://images.freeimages.com/images/large-previews/7e9/ladybird-1367182.jpg",@"https://images.freeimages.com/images/large-previews/23a/three-gondoliers-and-a-duck-1391336.jpg",@"https://images.freeimages.com/images/large-previews/05e/on-the-road-6-1384796.jpg",@"https://images.freeimages.com/images/large-previews/8b0/bed-post-1530404.jpg",@"https://images.freeimages.com/images/large-previews/d2f/bluebells-2007-1374105.jpg",@"https://images.freeimages.com/images/large-previews/b3d/flowers-1375316.jpg",@"https://images.freeimages.com/images/large-previews/b10/can-t-look-over-1312680.jpg",@"https://images.freeimages.com/images/large-previews/977/beach-1364350.jpg",@"https://images.freeimages.com/images/large-previews/411/light-of-technology-1510575.jpg",@"https://images.freeimages.com/images/large-previews/c45/old-technology-1530561.jpg",@"https://images.freeimages.com/images/large-previews/473/inside-flawed-technology-1450422.jpg", @"https://images.freeimages.com/images/large-previews/cda/technology-2-1464895.jpg",@"https://images.freeimages.com/images/large-previews/058/fujitsu-building-2-1233651.jpg", @"https://images.freeimages.com/images/large-previews/1ff/office-buildings-2-1218472.jpg",@"https://images.freeimages.com/images/large-previews/00f/buildings-1234010.jpg", @"https://images.freeimages.com/images/large-previews/25d/building-1524401.jpg",@"https://images.freeimages.com/images/large-previews/ac8/cmy-k-1427305.jpg", @"https://images.freeimages.com/images/large-previews/168/color-drop-1175815.jpg",@"https://cdn.pixabay.com/photo/2019/06/13/11/23/landscape-4271367_1280.jpg",@"https://images.freeimages.com/images/small-previews/9c3/sunshine-1408040.jpg",@"https://images.freeimages.com/images/small-previews/346/cemetery-1404186.jpg",@"https://images.freeimages.com/images/small-previews/6a5/dragon-fly-on-the-river-1394126.jpg",@"https://images.freeimages.com/images/small-previews/cba/3pears-1323727.jpg",@"https://images.freeimages.com/images/small-previews/981/cow-1380252.jpg",@"https://images.freeimages.com/images/small-previews/256/spring-1376144.jpg",@"https://images.freeimages.com/images/small-previews/cc5/athens-1380703.jpg",@"https://www.publicdomainpictures.net/pictures/250000/t2/surfers-paradise.jpg",@"https://cdn.pixabay.com/photo/2017/05/25/09/22/flower-2342706__480.jpg",@"https://cdn.pixabay.com/photo/2016/06/24/15/48/pattern-1477380__480.png",@"https://cdn.pixabay.com/photo/2016/06/25/17/36/rain-1479303__480.jpg",@"https://cdn.pixabay.com/photo/2019/04/20/18/46/the-squirrel-4142446__480.jpg",@"https://cdn.pixabay.com/photo/2014/04/14/20/11/japanese-cherry-trees-324175__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/14/22/03/planet-4274446__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/11/07/50/spitz-4266259__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/15/03/13/sunset-4274662__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/11/12/53/landscape-4266942__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/08/06/37/buzzard-4259649__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/10/19/28/ara-4265069__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/12/15/34/flash-4269596__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/09/07/23/margarite-4261593__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/13/14/08/cat-4271706__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/14/21/37/women-4274418__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/14/10/55/photomontage-4273365__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/10/21/37/duckling-4265486__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/14/23/41/railing-4274523__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/13/18/26/guard-dog-4272219__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/10/19/24/pot-bellied-pig-4265062__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/09/04/30/moon-4261463__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/11/23/40/palm-trees-4268028__480.png",@"https://cdn.pixabay.com/photo/2019/06/11/18/41/cat-4267680__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/11/23/48/rabbit-4268030__480.jpg",@"https://cdn.pixabay.com/photo/2019/06/13/11/18/swans-4271349__480.jpg"];
        
  }
    
    return self;
}

@end


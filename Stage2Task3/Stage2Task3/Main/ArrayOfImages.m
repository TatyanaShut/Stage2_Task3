//
//  ArrayOfImages.m
//  Stage2Task3
//
//  Created by Tatyana Shut on 16.06.2019.
//  Copyright © 2019 Tatyana Shut. All rights reserved.
//

#import "ArrayOfImages.h"

@interface ArrayOfImages()
@property (strong, nonatomic) NSArray *imageArray;
@end

@implementation ArrayOfImages
- (NSArray *)loadImage{
    self.imageArray = @[@"http://www.designerspics.com/wp-content/uploads/2014/06/laptop_headphone_free_photo1.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/fallen_leaves_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/06/shirts_free_photos.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/11/gifts_golder_wrapper_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/escalator_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/10/to_do_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/05/united_states_capitol_large_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/11/notebook_pen_free_photo.jpg",@"http://www.designerspics.com/wp-content/uploads/2014/07/pizza_free_photo.jpg", @"http://www.designerspics.com/wp-content/uploads/2014/12/xmas_decoration_2_free_photo.jpg",@"https://images.freeimages.com/images/large-previews/adf/sun-burst-1478549.jpg",@"https://images.freeimages.com/images/large-previews/7e9/ladybird-1367182.jpg",@"https://images.freeimages.com/images/large-previews/23a/three-gondoliers-and-a-duck-1391336.jpg",@"https://images.freeimages.com/images/large-previews/05e/on-the-road-6-1384796.jpg",@"https://images.freeimages.com/images/large-previews/8b0/bed-post-1530404.jpg",@"https://images.freeimages.com/images/large-previews/d2f/bluebells-2007-1374105.jpg",@"https://images.freeimages.com/images/large-previews/72c/fox-1522156.jpg",@"https://images.freeimages.com/images/large-previews/b3d/flowers-1375316.jpg",@"https://images.freeimages.com/images/large-previews/b10/can-t-look-over-1312680.jpg",@"https://images.freeimages.com/images/large-previews/977/beach-1364350.jpg",@"https://images.freeimages.com/images/large-previews/411/light-of-technology-1510575.jpg",@"https://images.freeimages.com/images/large-previews/c45/old-technology-1530561.jpg",@"https://images.freeimages.com/images/large-previews/473/inside-flawed-technology-1450422.jpg", @"https://images.freeimages.com/images/large-previews/cda/technology-2-1464895.jpg",@"https://images.freeimages.com/images/large-previews/058/fujitsu-building-2-1233651.jpg", @"https://images.freeimages.com/images/large-previews/1ff/office-buildings-2-1218472.jpg",@"https://images.freeimages.com/images/large-previews/00f/buildings-1234010.jpg", @"https://images.freeimages.com/images/large-previews/25d/building-1524401.jpg",@"https://images.freeimages.com/images/large-previews/ac8/cmy-k-1427305.jpg", @"https://images.freeimages.com/images/large-previews/168/color-drop-1175815.jpg"];
    return self.imageArray;
}
@end

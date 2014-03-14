//
//  DSViewController.m
//  TicTacToe
//
//  Created by Dan Szeezil on 3/13/14.
//  Copyright (c) 2014 Dan Szeezil. All rights reserved.
//

#import "DSViewController.h"

@interface DSViewController () <UIAlertViewDelegate>
{
    IBOutlet UILabel *myLabelOne;
    IBOutlet UILabel *myLabelTwo;
    IBOutlet UILabel *myLabelThree;
    IBOutlet UILabel *myLabelFour;
    IBOutlet UILabel *myLabelFive;
    IBOutlet UILabel *myLabelSix;
    IBOutlet UILabel *myLabelSeven;
    IBOutlet UILabel *myLabelEight;
    IBOutlet UILabel *myLabelNine;
   
    IBOutlet UILabel *whichPlayerLabel;
    
}


- (UILabel*)findLabelUsingPoint:(CGPoint)point;
- (NSString *)whoOne;
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;


@end


@implementation DSViewController


// start game as player X
BOOL playerX = YES;


- (void)viewDidLoad
{
    [super viewDidLoad];

    
}


- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
  
// Once a touch is registered, get point, clarify if it was in the Player Toggle, then pass point to findLabel, which determines which label was touched, then change the label to X or O.

    
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    
    
// check if touch was on Player Toggle and then which player is playing
    if (CGRectContainsPoint(whichPlayerLabel.frame, point)) {
        if (playerX) {
            whichPlayerLabel.text = @"O";
            whichPlayerLabel.textColor = [UIColor redColor];
            playerX = NO;
        } else if (!playerX){
            whichPlayerLabel.text = @"X";
            whichPlayerLabel.textColor = [UIColor blueColor];
            playerX = YES;
        }
    }
    
    
//  figure out which label was selected
    UILabel *chosenLabel = [self findLabelUsingPoint:point];
   
    
//  check if label is occupied and set label to X or O
    if ([chosenLabel.text isEqualToString:@""]) {
        if (playerX) {
            chosenLabel.text = @"X";
            chosenLabel.textColor = [UIColor blueColor];
        }else {
            chosenLabel.text = @"O";
            chosenLabel.textColor = [UIColor redColor];
        }
    }

    
//  check to see if anyone wins
    NSString *winner = [self whoOne];
    
    
//  if someone wines, create AlertView
    if ([winner isEqualToString:@"X is the Winner"] || [winner isEqualToString:@"O is the Winner"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tic Tac Toe"
                                                        message:winner
                                                       delegate:self
                                              cancelButtonTitle:@"Restart Game"
                                              otherButtonTitles:nil];
        [alert show];
    }

//  End of body
}



// method to find & return label touched
- (UILabel*)findLabelUsingPoint:(CGPoint)point {
    
    UILabel *selectedLabel = nil;
    
    if (CGRectContainsPoint(myLabelOne.frame, point)) {
        selectedLabel = myLabelOne;
    } else if (CGRectContainsPoint(myLabelTwo.frame, point)){
        selectedLabel = myLabelTwo;
    } else if (CGRectContainsPoint(myLabelThree.frame, point)){
        selectedLabel = myLabelThree;
    } else if (CGRectContainsPoint(myLabelFour.frame, point)){
        selectedLabel = myLabelFour;
    } else if (CGRectContainsPoint(myLabelFive.frame, point)){
        selectedLabel = myLabelFive;
    } else if (CGRectContainsPoint(myLabelSix.frame, point)){
        selectedLabel = myLabelSix;
    } else if (CGRectContainsPoint(myLabelSeven.frame, point)){
        selectedLabel = myLabelSeven;
    } else if (CGRectContainsPoint(myLabelEight.frame, point)){
        selectedLabel = myLabelEight;
    } else if (CGRectContainsPoint(myLabelNine.frame, point)){
        selectedLabel = myLabelNine;
    }
    
    return selectedLabel;
    
}


// method should confirm that 3 labels have text, if so, are they consecutive, if so, do they match (x or o), if so which letter are they

- (NSString *)whoOne {
    
    NSString *winnerString = @"";
    
    if ( [[myLabelOne.text stringByAppendingString:[myLabelTwo.text stringByAppendingString:myLabelThree.text]] isEqualToString:@"XXX"] ){
        winnerString = @"X is the Winner";
    } else if ( [[myLabelOne.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelOne.text stringByAppendingString:[myLabelFour.text stringByAppendingString:myLabelSeven.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelSeven.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelThree.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelTwo.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelEight.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelThree.text stringByAppendingString:[myLabelSix.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelFour.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelSix.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    } else if ( [[myLabelSeven.text stringByAppendingString:[myLabelEight.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"XXX"]  ) {
        winnerString = @"X is the Winner";
    }
    
    
    if ( [[myLabelOne.text stringByAppendingString:[myLabelTwo.text stringByAppendingString:myLabelThree.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelOne.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelOne.text stringByAppendingString:[myLabelFour.text stringByAppendingString:myLabelSeven.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelSeven.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelThree.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelTwo.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelEight.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelThree.text stringByAppendingString:[myLabelSix.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelFour.text stringByAppendingString:[myLabelFive.text stringByAppendingString:myLabelSix.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    } else if ( [[myLabelSeven.text stringByAppendingString:[myLabelEight.text stringByAppendingString:myLabelNine.text]] isEqualToString:@"OOO"] ){
        winnerString = @"O is the Winner";
    }
    
    return winnerString;
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
    // I couldnt find a way to reload the view properly - I googled the crap out of it
        myLabelOne.text = @"";
        myLabelTwo.text = @"";
        myLabelThree.text = @"";
        myLabelFour.text = @"";
        myLabelFive.text = @"";
        myLabelSix.text = @"";
        myLabelSeven.text = @"";
        myLabelEight.text = @"";
        myLabelNine.text = @"";
    }
}








//  IGNORE ALL THIS BELOW - TRIED SOMETHING CREATIVE THAT FAILED!
//- (NSString *)whoOne:(UILabel *)winnerLabel {
//    
//    NSString *winnerIs = @"";
//    
//    if ([winnerLabel.text isEqualToString:@"X"]) {
//        
//        if (winnerLabel == myLabelOne)
//        {
//            countX += 1;
//        } else if (winnerLabel == myLabelTwo)
//        {
//            countX += 2;
//        } else if (winnerLabel == myLabelThree)
//        {
//            countX += 4;
//        } else if (winnerLabel == myLabelFour)
//        {
//            countX += 8;
//        } else if (winnerLabel == myLabelFive)
//        {
//            countX += 16;
//        } else if (winnerLabel == myLabelSix)
//        {
//            countX += 32;
//        } else if (winnerLabel == myLabelSeven)
//        {
//            countX += 64;
//        } else if (winnerLabel == myLabelEight)
//        {
//            countX += 128;
//        } else if (winnerLabel == myLabelNine)
//        {
//            countX += 256;
//        }
//    }
//    
//    
//    if ([winnerLabel.text isEqualToString:@"O"]) {
//        
//        if (winnerLabel == myLabelOne)
//        {
//            countO += 1;
//        } else if (winnerLabel == myLabelTwo)
//        {
//            countO += 2;
//        } else if (winnerLabel == myLabelThree)
//        {
//            countO += 4;
//        } else if (winnerLabel == myLabelFour)
//        {
//            countO += 8;
//        } else if (winnerLabel == myLabelFive)
//        {
//            countO += 16;
//        } else if (winnerLabel == myLabelSix)
//        {
//            countO += 32;
//        } else if (winnerLabel == myLabelSeven)
//        {
//            countO += 64;
//        } else if (winnerLabel == myLabelEight)
//        {
//            countO += 128;
//        } else if (winnerLabel == myLabelNine)
//        {
//            countO += 256;
//        }
//    }
//    
//    
//    
//    if ( (countX == 84) || (countX == 7) || (countX == 56) || (countX == 448) || (countX == 273) || (countX == 292) || (countX == 146) || (countX == 73)) {
//        winnerIs = @"The winner is X!";
//    }
//    
//    if ( (countO == 84) || (countO == 7) || (countO == 56) || (countO == 448) || (countO == 273) || (countO == 292) || (countO == 146) || (countO == 73)) {
//        winnerIs = @"The winner is O!";
//    }
//
//    return winnerIs;
//}


@end





#import "ParseStarterProjectViewController.h"
#import <Parse/Parse.h>

@implementation ParseStarterProjectViewController


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if([PFUser currentUser]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged In!" message:@"Logged In!" delegate:nil cancelButtonTitle:@"Log Me Out" otherButtonTitles:nil, nil];
        [alert show];
        [PFUser logOut];
    }
    
    PFLogInViewController *login = [[PFLogInViewController alloc] init];
    login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton;
    login.delegate = self;
    login.signUpController.delegate = self;
    [self presentModalViewController:login animated:YES];
}

#pragma mark - UIViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissModalViewControllerAnimated:YES];
}

- (void) signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    [self dismissModalViewControllerAnimated:YES];
}

@end

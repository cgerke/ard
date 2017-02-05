//
//  main.m
//  ard
//
//  Created by chris.gerke@gmail.com on 1/22/16.
//  Copyright © 2016 cgerke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        setuid(0);
		setgid(0);
		seteuid(0);
		
        // one parameter is required
		if (argc!=2)
		{
    		// output usage
            printf("Usage: ard [-on|-req]\n");
            printf("               \n");
            printf("       -on     Enables observe/control but allows\n");
            printf("               without requiring the end user to accept\n");
            printf("               a request for remote access.\n");
            printf("               \n");
            printf("       -req    Disables observe/control but allows\n");
            printf("               Administrators to request remote access.\n");
            printf("               \n");
            printf("               Note : Not supplying a switch defaults to -on and prints help.\n");
            printf("               \n");
            system("sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -allowAccessFor -allUsers -access -on -privs -all -clientopts -setvnclegacy -vnclegacy yes -restart -agent");
    		// leave with code 1
    		exit(1);
		}
        
        NSString *arg1 = [NSString stringWithUTF8String:argv[1]];
        
        if ([arg1 isEqual:@"-on"]) {
        	system("sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -allowAccessFor -allUsers -access -on -privs -all -clientopts -setvnclegacy -vnclegacy yes -restart -agent");
        }

        if ([arg1 isEqual:@"-req"]) {
            system("sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -allowAccessFor -allUsers -access -on -privs -GenerateReports -ChangeSettings -SendFiles -TextMessages -DeleteFiles -clientopts -setvnclegacy -vnclegacy no -setreqperm -reqperm yes -setmenuextra -menuextra no -restart -agent");   
        }
        
	
    }
    return 0;
}

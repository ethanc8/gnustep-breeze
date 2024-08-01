#import <GSINI/INIReader.h>

int main(int argc, char** argv) {
    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
    NSDictionary* dictionary = INIDictionaryForINIAtPath([environment[@"HOME"] stringByAppendingString: @"/.config/kdeglobals"]);
    NSLog(@"~/.config/kdeglobals: %@", dictionary);
}
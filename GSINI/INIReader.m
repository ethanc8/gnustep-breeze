#import "INIReader.h"

static int handler(void* user, const char* sectionName_c, const char* key_c,
                   const char* value_c)
{
    NSMutableDictionary* dictionary = user;
    NSString* sectionName = [NSString stringWithUTF8String:sectionName_c];
    NSString* key = [NSString stringWithUTF8String: key_c];
    NSString* value = [NSString stringWithUTF8String: value_c];
    NSMutableDictionary* sectionDict = dictionary[sectionName];
    if(!sectionDict) {
        sectionDict = [NSMutableDictionary dictionary];
        dictionary[sectionName] = sectionDict;
    }
    sectionDict[key] = value;
    return 1; // true
}

NSDictionary* INIDictionaryForINIAtPath(NSString* path) {
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionary];
    if (ini_parse([path UTF8String], handler, dictionary) < 0) {
        NSLog(@"Can't load INI file %@", path);
        return nil;
    }
    return dictionary;
}
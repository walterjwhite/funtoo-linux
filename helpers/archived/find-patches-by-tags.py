#!/bin/env /usr/bin/python3

from optparse import OptionParser
import logging
import os


#logger = logging.getLogger(__name__)


def get_arguments():
    parser = OptionParser()
    parser.add_option("-t",
                      dest="tag_string",
                      help="tags to match")
    parser.add_option("-m",
                      dest="match_type", default="or",
                      help="whether the tags should be and'd or or'd")
    
    (options, arguments) = parser.parse_args()
    
    try:
        options.tags = sorted(options.tag_string.split(','))

        return (options)
    except AttributeError:
        print("You must enter at least 1 tag")
        exit(1)


def __get_tags__(patch):
    patch_tags = []
    
    try:
        with open(os.path.join(patch, 'tags')) as tf:
            #print('searching' + patch)

            for line in tf:
                cleaned_line = line.strip()

                if cleaned_line and cleaned_line.find('#') < 0:
                    patch_tags.append(cleaned_line)
    
        return(sorted(patch_tags))
    except IOError:
        return(patch_tags)


def __matches__(patch, tags, match_type):
    patch_tags = __get_tags__(patch)
    
    if match_type == 'or':
        for patch_tag in patch_tags:
            if patch_tag in tags:
                return(True)
        
        return(False)

    #print('comparing tags')
    return(patch_tags == tags)


def get_patches():
    arguments = get_arguments()
    tags = arguments.tags
    match_type = arguments.match_type
    
    #print(tags)
    
    for root, directories, files in sorted(os.walk('patches')):
        for directory in directories:
            if directory.endswith(".patch"):
                patch = os.path.join(root, directory)
                
                #print('searching' + patch)
                if __matches__(patch, tags, match_type):
                    print(patch)


get_patches()

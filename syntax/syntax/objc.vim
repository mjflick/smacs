" Vim syntax file
" Language:    Objective-C
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case match

" Comments
syn keyword objcTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region objcComment start="//" end="$" contains=objcTodo
syn region objcComment start="/\*" end="\*/" contains=objcTodo

" Strings
syn region objcString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=objcEscape,objcFormat
syn match objcObjCString /@"/me=s+1 nextgroup=objcString
syn match objcEscape contained +\\[abfnrtv\\"'0]+
syn match objcEscape contained +\\x[0-9a-fA-F]\{1,2}+
syn match objcEscape contained +\\[0-7]\{1,3}+
syn match objcEscape contained +\\u[0-9a-fA-F]\{4}+
syn match objcEscape contained +\\U[0-9a-fA-F]\{8}+

" Characters
syn match objcCharacter +'[^'\\]'+
syn match objcCharacter +'\\[abfnrtv\\'"]'+
syn match objcCharacter +'\\x[0-9a-fA-F]\{1,2}'+
syn match objcCharacter +'\\[0-7]\{1,3}'+

" Numbers
syn match objcInteger "\<\d[0-9_]*[uUlL]*\>"
syn match objcInteger "\<0[xX][0-9a-fA-F][0-9a-fA-F_]*[uUlL]*\>"
syn match objcInteger "\<0[0-7][0-7_]*[uUlL]*\>"
syn match objcInteger "\<0[bB][01][01_]*[uUlL]*\>"
syn match objcFloat "\<\d[0-9_]*\.\d[0-9_]*[fFlL]\?\>"
syn match objcFloat "\<\d[0-9_]*\.[0-9_]*[eE][+-]\?\d[0-9_]*[fFlL]\?\>"
syn match objcFloat "\<\d[0-9_]*[eE][+-]\?\d[0-9_]*[fFlL]\?\>"

" C Keywords
syn keyword objcKeyword auto break case const continue default do else enum
syn keyword objcKeyword extern for goto if inline register restrict return
syn keyword objcKeyword sizeof static struct switch typedef union unsigned
syn keyword objcKeyword void volatile while signed long short int float
syn keyword objcKeyword double char _Bool _Complex _Imaginary

" Objective-C Keywords
syn match objcObjCKeyword "@interface\|@implementation\|@end\|@protocol"
syn match objcObjCKeyword "@optional\|@required\|@property\|@synthesize"
syn match objcObjCKeyword "@dynamic\|@class\|@public\|@private\|@protected"
syn match objcObjCKeyword "@package\|@try\|@catch\|@finally\|@throw"
syn match objcObjCKeyword "@selector\|@encode\|@synchronized\|@autoreleasepool"
syn match objcObjCKeyword "@compatibility_alias\|@available"
syn keyword objcObjCKeyword self super nil Nil YES NO true false id Class
syn keyword objcObjCKeyword SEL IMP BOOL instancetype

" Conditional
syn keyword objcConditional if else switch case default

" Repeat
syn keyword objcRepeat for while do

" Exception
syn match objcException "@try\|@catch\|@finally\|@throw"

" Types - Foundation
syn keyword objcType NSObject NSString NSMutableString NSArray NSMutableArray
syn keyword objcType NSDictionary NSMutableDictionary NSSet NSMutableSet
syn keyword objcType NSNumber NSInteger NSUInteger CGFloat NSData
syn keyword objcType NSMutableData NSURL NSURLRequest NSURLSession
syn keyword objcType NSError NSException NSNotification NSNotificationCenter
syn keyword objcType NSTimer NSDate NSDateFormatter NSCalendar NSLocale
syn keyword objcType NSBundle NSFileManager NSUserDefaults NSThread
syn keyword objcType NSOperationQueue NSOperation

" Types - GCD
syn keyword objcType dispatch_queue_t dispatch_group_t dispatch_semaphore_t

" Types - UIKit / CoreGraphics
syn keyword objcType UIView UIViewController UILabel UIButton UITableView
syn keyword objcType UICollectionView UIImage UIColor CGRect CGPoint CGSize

" Built-in functions
syn keyword objcBuiltin NSLog NSMakeRange NSMakeRect NSMakePoint NSMakeSize
syn keyword objcBuiltin CGRectMake CGPointMake CGSizeMake
syn keyword objcBuiltin dispatch_async dispatch_sync dispatch_get_main_queue
syn keyword objcBuiltin dispatch_get_global_queue dispatch_once dispatch_after
syn keyword objcBuiltin dispatch_group_create dispatch_group_enter
syn keyword objcBuiltin dispatch_group_leave dispatch_group_notify

" Common methods
syn keyword objcBuiltin alloc init new copy mutableCopy release retain
syn keyword objcBuiltin autorelease dealloc description isEqual hash class
syn keyword objcBuiltin superclass isKindOfClass isMemberOfClass
syn keyword objcBuiltin respondsToSelector performSelector conformsToProtocol

" C standard library
syn keyword objcBuiltin printf fprintf sprintf snprintf malloc calloc realloc
syn keyword objcBuiltin free memcpy memset memmove strlen strcmp strncmp
syn keyword objcBuiltin strcpy strncpy strcat strncat

" Constants
syn keyword objcConstant NULL nil Nil YES NO true false
syn keyword objcConstant NSNotFound CGFLOAT_MAX CGFLOAT_MIN
syn keyword objcConstant NSIntegerMax NSIntegerMin NSUIntegerMax

" Preprocessor
syn region objcPreProc start="^\s*#\s*\(include\|import\|if\|ifdef\|ifndef\|else\|elif\|endif\|define\|undef\|pragma\|warning\|error\|line\)" end="$" contains=objcComment,objcString
syn match objcInclude "#\s*\(include\|import\)\s*[<\"]" contains=objcIncludePath
syn region objcIncludePath contained start=+[<"]+ end=+[>"]+

" Operators
syn match objcOperator "[-+*/%]=\?"
syn match objcOperator "[<>]=\?"
syn match objcOperator "==\|!="
syn match objcOperator "&&\|||"
syn match objcOperator "!\|~"
syn match objcOperator "&\||\|\^"
syn match objcOperator "<<\|>>"
syn match objcOperator "->"
syn match objcOperator "++"
syn match objcOperator "--"
syn match objcOperator "?"
syn match objcOperator "::"

" Message send brackets
syn region objcMessage start="\[" end="\]" contains=TOP

" Property attributes
syn keyword objcPropAttr nonatomic atomic strong weak assign copy readonly
syn keyword objcPropAttr readwrite retain getter setter class nullable
syn keyword objcPropAttr nonnull null_resettable null_unspecified

" Block syntax
syn match objcBlock "\^"

" Format specifiers in strings
syn match objcFormat "%[-+ #0]*\*\?\(\d\+\)\?\(\.\(\d\+\|\*\)\)\?[hlLqjzt]*[diouxXeEfFgGaAcspn@%]" contained containedin=objcString

" Function declarations
syn match objcFunction "\<[a-zA-Z_][a-zA-Z0-9_]*\>\ze\s*("

hi def link objcComment Comment
hi def link objcTodo Todo
hi def link objcString String
hi def link objcObjCString Special
hi def link objcEscape Special
hi def link objcCharacter String
hi def link objcInteger Number
hi def link objcFloat Number
hi def link objcKeyword Keyword
hi def link objcObjCKeyword Keyword
hi def link objcConditional Conditional
hi def link objcRepeat Repeat
hi def link objcException Exception
hi def link objcType Type
hi def link objcBuiltin Function
hi def link objcConstant Constant
hi def link objcPreProc PreProc
hi def link objcInclude PreProc
hi def link objcIncludePath String
hi def link objcOperator Operator
hi def link objcPropAttr Keyword
hi def link objcBlock Special
hi def link objcFormat Special
hi def link objcFunction Function

let b:current_syntax = "objc"

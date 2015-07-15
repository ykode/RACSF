//
//  SFRestAPI+RACSupport.m
//  SFRestAPI ReactiveCocoa
//
//  Created by RMS NOOR HPD on 14/07/15.
//  Copyright (c) 2015 YKode. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SFRestAPI+RACSupport.h"

@implementation SFRestAPI (RACSupport)

- (RACSignal *)rac_sendRESTRequest:(SFRestRequest *)request
{
	return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
		[self sendRESTRequest:request failBlock:^(NSError *e) {
			[subscriber sendError:e];
		}
		completeBlock:^(id response) {
			[subscriber sendNext:response];
			[subscriber sendCompleted];
		}];
		return [RACDisposable disposableWithBlock:^{
			[request cancel];
		}];
	}];
}

- (RACSignal *)rac_performSOQLQuery:(NSString *)query
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQuery:query];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*) rac_performSOQLQueryAll:(NSString *)query
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForQueryAll:query];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*) rac_performSOSLSearch:(NSString *)search
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForSearch:search];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performDescribeGlobal
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForDescribeGlobal];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performUpdateWithObjectType:(NSString *)objectType
									  objectId:(NSString *)objectId
										fields:(NSDictionary *)fields
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForUpdateWithObjectType:objectType
																			   objectId:objectId
																				 fields:fields];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performUpsertWithObjectType:(NSString *)objectType
							  externalIdField:(NSString *)externalIdField
								   externalId:(NSString *)externalId
									   fields:(NSDictionary *)fields
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForUpsertWithObjectType:objectType
																	   externalIdField:externalIdField
																			externalId:externalId
																				fields:fields];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performCreateWithObjectType:(NSString *)objectType
									   fields:(NSDictionary *)fields
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForCreateWithObjectType:objectType
																				 fields:fields];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performDeleteWithObjectType:(NSString *)objectType
									 objectId:(NSString *)objectId
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForDeleteWithObjectType:objectType
																			   objectId:objectId];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performDescribeWithObjectType:(NSString *)objectType
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForDescribeWithObjectType:objectType];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performMetadataWithObjectType:(NSString *)objectType
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForMetadataWithObjectType:objectType];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performRetrieveWithObjectType:(NSString *) objectType
									   objectId:(NSString *) objectId
										 fieldList:(NSArray *) fieldList;
{
	NSString *fields = fieldList ? [[[NSSet setWithArray:fieldList] allObjects] componentsJoinedByString:@","] : nil;
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForRetrieveWithObjectType:objectType
																				 objectId:objectId
																				fieldList:fields];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal*)rac_performRequestForResources
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForResources];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performRequestVersions;
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForVersions];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performRequestForFileRendition:(NSString *)sfdcId
										  version:(NSString *)version
									renditionType:(NSString *)renditionType
											 page:(NSUInteger)page
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForFileRendition:sfdcId
																		 version:version
																   renditionType:renditionType
																			page:page];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performRequestForSearchScopeAndOrder
{
	SFRestRequest *request = [[SFRestAPI sharedInstance] requestForSearchScopeAndOrder];
	return  [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performRequestForSearchResultLayout:(NSString *)objectList
{
	SFRestRequest *request =[[SFRestAPI sharedInstance] requestForSearchResultLayout:objectList];
	return [self rac_sendRESTRequest:request];
}

- (RACSignal *)rac_performRequestWithMethod:(SFRestMethod)method path:(NSString *)path queryParams:(NSDictionary *)queryParams
{
	SFRestRequest *request = [SFRestRequest requestWithMethod:method
														 path:path
												  queryParams:queryParams];
	return [self rac_sendRESTRequest:request];
}

@end

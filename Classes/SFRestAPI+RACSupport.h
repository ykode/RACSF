//
//  SFRestAPI+RACSupport.h
//  SFRestAPI ReactiveCocoa Support
//
//  Created by RMS NOOR HPD on 14/07/15.
//  Copyright (c) 2015 YKode. All rights reserved.
//

#import <SalesforceRESTAPI.h>

@class RACSignal;
@class SFRestRequest

@interface SFRestAPI (RACSupport)
- (RACSignal*) rac_sendRESTRequest: (SFRestRequest*) request;

- (RACSignal*) rac_performSOQLQuery: (NSString*) query;

- (RACSignal*) rac_performSOQLQueryAll: (NSString*) query;

- (RACSignal*) rac_performSOSLSearch: (NSString*) search;

- (RACSignal*) rac_performDescribeGlobal;

- (RACSignal*) rac_performDescribeWithObjectType: (NSString*) objectType;

- (RACSignal*) rac_performMetadataWithObjectType: (NSString*) objectType;

- (RACSignal*) rac_performRetrieveWithObjectType: (NSString *)objectType
										objectId:(NSString *)objectId
									   fieldList:(NSArray *)fieldList;

- (RACSignal*) rac_performUpdateWithObjectType:(NSString *)objectType
									  objectId:(NSString *)objectId
										fields:(NSDictionary *)fields;

- (RACSignal*) rac_performUpsertWithObjectType:(NSString *)objectType
							   externalIdField:(NSString *)externalIdField
									externalId:(NSString *)externalId
										fields:(NSDictionary *)fields;

- (RACSignal*) rac_performDeleteWithObjectType:(NSString *)objectType
									  objectId:(NSString *)objectId;

- (RACSignal*) rac_performCreateWithObjectType:(NSString *)objectType
										fields:(NSDictionary *)fields;

- (RACSignal*) rac_performRequestForResources;

- (RACSignal*) rac_performRequestVersions;

- (RACSignal*) rac_performRequestForFileRendition:(NSString *)sfdcId
										  version:(NSString *)version
									renditionType:(NSString *)renditionType
											 page:(NSUInteger)page;

- (RACSignal*) rac_performRequestForSearchScopeAndOrder;

- (RACSignal*) rac_performRequestForSearchResultLayout: (NSString*) objectList;

- (RACSignal*) rac_performRequestWithMethod:(SFRestMethod)method
									   path:(NSString*)path
								queryParams:(NSDictionary*)queryParams;
@end

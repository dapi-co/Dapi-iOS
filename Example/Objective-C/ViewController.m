//
//  ViewController.m
//  DapiObj-Example
//
//  Created by MSZ on 02/11/2022.
//

#import "ViewController.h"

@import DapiSDK;

@interface ViewController () <DAPIConnectDelegate,DAPIAutoFlowDelegate>

@property (nonatomic, strong,nullable) DAPIBankConnection *selectedConnection;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)addConnectionTapped {
    DAPIConnectVC *connect = [[DAPIConnectVC alloc] init];
    connect.delegate = self;
    [self presentViewController:connect animated:true completion:nil];
}

- (IBAction)listConnectionTapped:(UIBarButtonItem *)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Connection"
                                 message:@"Choose a global connection to operate on"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSArray<DAPIBankConnection *> *connections = Dapi.shared.bankConnections;
    NSLog(@"connections %@", connections);
    for (int i = 0; i < [connections count]; i++) {
        DAPIBankConnection *connection = connections[i];
        NSLog(@"connections %@", connection);
        UIAlertAction* buttonAction = [UIAlertAction
                                       actionWithTitle:connection.bankInfo.bankShortName
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
            self.selectedConnection = connection;
            [sender setTitle:connection.bankInfo.bankShortName];
        }];
        [alert addAction:buttonAction];
        
    }
    UIAlertAction* cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:nil];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dapiConnect:(DAPIConnectVC * _Nonnull)dapiConnect didFailConnectingWith:(NSString * _Nonnull)error {
    NSLog(@"Connection Failed: %@", error);
}

- (void)dapiConnect:(DAPIConnectVC * _Nonnull)dapiConnect didSuccessfullyConnectTo:(NSString * _Nullable)bankID
     bankConnection:(DAPIBankConnection * _Nonnull)bankConnection {
    NSLog(@"Successful Connection: %@", bankConnection.userID);
    
}

- (void)dapiConnectUserDidCancel:(DAPIConnectVC * _Nonnull)dapiConnect {
    NSLog(@"ConnectUserDidCancel");
}
//---------------

- (void)autoFlow:(DAPIAutoFlowVC * _Nonnull)autoFlow
transferDidSuccessFrom:(DAPIBankAccount * _Nonnull)senderAccount
  transferResult:(DAPITransferResult * _Nonnull)transferResult {
    NSLog(@"transferDidSuccessFrom: amount error %@", transferResult);
    NSLog(@"transferDidSuccessFrom senderAccount %@", senderAccount);
    
}

- (void)autoFlow:(DAPIAutoFlowVC * _Nonnull)autoFlow
willTransferAmount:(float)amount
     fromAccount:(DAPIBankAccount * _Nonnull)senderAccount {
    NSLog(@"willTransferAmount: amount %f", amount);
    NSLog(@"willTransferAmount senderAccount %@", senderAccount);
}

- (void)autoFlowUserDidCanceled:(DAPIAutoFlowVC * _Nonnull)autoFlow {
    NSLog(@"autoFlowUserDidCanceled");

}

- (void)autoFlow:(DAPIAutoFlowVC *)autoFlow
transferDidFailFrom:(DAPIBankAccount *)senderAccount
              to:(DAPIBeneficiary *)beneficiary
            with:(NSError *)error{
    NSLog(@"transferDidFail Error: %@", error.dapiErrorMessage);
    NSLog(@"transferDidFailFrom Account: %@", senderAccount);
    NSLog(@"transferDidFailTo beneficiary %@", beneficiary);
}


- (void)autoFlow:(DAPIAutoFlowVC *)autoFlow
transferDidFailFrom:(DAPIBankAccount *)senderAccount
toWireBeneficiary:(DAPIWireBeneficiary *)beneficiary
            with:(NSError *)error {
    NSLog(@"transferDidFail Error: %@", error.dapiErrorMessage);
    NSLog(@"transferDidFailFrom Account: %@", senderAccount);
    NSLog(@"transferDidFail to beneficiary %@", beneficiary);
}
//---------------
- (IBAction)identityTapped {
    if ([self selectedConnection] == nil ) { return; }
    DAPIBankConnection *connection = [self selectedConnection];

    [Dapi.shared identityWithBankConnection:connection
                                 completion:^(DAPIIdentityResponse * _Nullable response , NSError * _Nullable error) {
        NSLog(@"[DAPI] Success: %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
    }];
}

- (IBAction)accountMetadataTapped {
    if ([self selectedConnection] == nil ) { return; }

    [Dapi.shared accountMetadataWithBankConnection: [self selectedConnection]
                                        completion:^(DAPIAccountMetadataResponse * _Nullable response , NSError * _Nullable error) {
        NSLog(@"[DAPI] Success operationID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
    
}

- (IBAction)bankCardsTapped {
    if ([self selectedConnection] == nil ) { return; }

    DAPIBankConnection *connection = [self selectedConnection];
    [Dapi.shared bankCardsWithBankConnection: connection
                                  completion:^(DAPIBankCardsResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"[DAPI] Success operationID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);

    }];
}

- (IBAction)accountsTapped {
    
    if ([self selectedConnection] == nil ) { return; }
    DAPIBankConnection *connection = [self selectedConnection];
    [Dapi.shared bankAccountsWithBankConnection:connection
                                     completion:^(DAPIBankAccountsResponse * _Nullable response,
                                                  NSError * _Nullable error) {
        NSLog(@"[DAPI] Success operationID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);

    }];
}

- (IBAction)accountTransactionsTapped {
    if ([self selectedConnection] == nil ) { return; }
    DAPIBankConnection *connection = [self selectedConnection];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    [Dapi.shared bankAccountsWithBankConnection:connection
                                     completion:^(DAPIBankAccountsResponse * _Nullable response,
                                                  NSError * _Nullable error) {
        DAPIBankAccount *account = response.accounts.firstObject;
        [Dapi.shared accountTransactionsWithBankConnection: connection
                                             bankAccountID: account.accountID
                                                      type:DAPITransactionTypeDefault
                                                      from:[dateFormatter dateFromString: @"2022-01-01"]
                                                        to:[dateFormatter dateFromString: @"2022-11-09"]
                                                completion:^(DAPITransactionsResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"[DAPI] Success operationID : %@",response.operationID);
            NSLog(@"[DAPI] Success response : %@",response);
            NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
            NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
            NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
        }];

    }];
}

- (IBAction)deleteConnectionTapped {
    if ([self selectedConnection] == nil ) { return; }
    DAPIBankConnection *connection = [self selectedConnection];
    
    [Dapi.shared delinkWithBankConnection:connection
                               completion:^(DAPIResponseResult * _Nullable result, NSError * _Nullable error) {
        
        NSLog(@"[DAPI] Success operationID : %@",result.operationID);
        NSLog(@"[DAPI] Success response : %@",result);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
    
    
}

- (IBAction)getConnectionTapped {
    if ([self selectedConnection] == nil ) { return; }
    DAPIBankConnection *connection = [self selectedConnection] ;
    NSDictionary *params = [connection getParameters];
    NSLog(@"[DAPI] connection parameters: %@",params);
}

- (IBAction)createConnectionTapped {
    if ([self selectedConnection] == nil ) { return; }
    NSDictionary *parameters =  @{
        @"userID": @"U6Kx3/if3Ko7FDg9ypVoZmzzEWFMzrsVjVA/PNYoyiPF8HGl0CvaSpgnsnVep49H8D2pDEROAc3L24P+s6ZfrQ==",
        @"tokenID": @"f6335219-7466-44ef-8031-22e9739315cd",
        @"connectionID": @"a6479d32-d062-41f6-abea-0f374ed7d677",
        @"clientUserID": @"JohnDoe",
        @"userSecret": @"userSecret",
        @"bankId": @"DAPIBANK_AE_ENBD",
        @"name": @"ENBD"
    };
    
    [Dapi.shared createBankConnectionWithParameters:parameters
                                         completion:^(DAPIBankConnection * _Nullable connection,
                                                      NSError * _Nullable error) {
        NSLog(@"[DAPI] Success userID : %@",connection.userID);
        NSLog(@"[DAPI] Success response : %@",connection);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
}

- (IBAction)cardTransactionsTapped {
    if ([self selectedConnection] == nil) {return;}
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    DAPIBankConnection *connection = [self selectedConnection];
    [Dapi.shared bankCardsWithBankConnection:connection
                                     completion:^(DAPIBankCardsResponse * _Nullable response,
                                                  NSError * _Nullable error) {
        DAPIBankCard *account = response.cards.firstObject;
        [Dapi.shared cardTransactionsWithBankConnection: connection
                                                 cardID: account.cardID
                                                      type:DAPITransactionTypeDefault
                                                      from:[dateFormatter dateFromString: @"2022-11-01"]
                                                        to:[dateFormatter dateFromString: @"2023-03-05"]
                                                completion:^(DAPITransactionsResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"[DAPI] Success userID : %@",response.operationID);
            NSLog(@"[DAPI] Success response : %@",response);
            NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
            NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
            NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
        }];

    }];
}

- (IBAction)bankBeneficiariesTapped {
    if ([self selectedConnection] == nil ) { return; }
    [Dapi.shared bankBeneficiariesWithBankConnection:[self selectedConnection]
                                          completion:^(DAPIBankBeneficiariesResponse * _Nullable response, NSError * _Nullable error) {
       
        NSLog(@"[DAPI] Success userID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);

    }];
    
    
}

- (IBAction)bankWireBeneficiariesTapped {
    if ([self selectedConnection] == nil ) { return; }
    [Dapi.shared bankWireBeneficiariesWithBankConnection:[self selectedConnection]
                                              completion:^(DAPIBankWireBeneficiariesResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"[DAPI] Success userID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
    
    
}

- (IBAction)transferAutoFlowTapped {
    if ([self selectedConnection] == nil ) { return; }
        
        DAPIAutoFlowVC *autoflow = [[DAPIAutoFlowVC alloc] initWithBankConnection:[self selectedConnection]
                                                                          account:nil
                                                                  wireBeneficiary: nil
                                                                      beneficiary:[self beneficiary]
                                                                     transferType:DAPITransferTypeNormal
                                                                           amount:0
                                                                           remark:@"remark"];
        [autoflow setTransferDidSucceed:^(DAPITransferResult * _Nonnull transferData) {
            NSLog(@"[DAPI] Success: data %@",transferData.message);
            NSLog(@"[DAPI] Success: data %@",transferData.referenceNumber);
            NSLog(@"[DAPI] Success: data %@",transferData.remark);
            NSLog(@"[DAPI] Success: data %@",transferData.operationID);
            NSLog(@"[DAPI] Success: data %@",transferData.senderAccountID);

        }];
        [autoflow setTransferDidFail:^(NSError  * _Nonnull error ) {
            NSLog(@"[DAPI] error: data %@",error.dapiOperationID);
            NSLog(@"[DAPI] type: data %@",error.dapiErrorType);
            NSLog(@"[DAPI] code: data %@",error.dapiStatusCode);
            NSLog(@"[DAPI] code: data %@",error.dictionaryRepresentation);
            NSDictionary *coolDownPeriod = [error.dictionaryRepresentation objectForKey:@"coolDownPeriod"];
            NSNumber *value = [coolDownPeriod objectForKey:@"value"];
            NSString *unit = [coolDownPeriod objectForKey:@"unit"];
            
        }];
        [autoflow setAutoFlowDelegate:self];
        [self presentViewController:autoflow animated:YES completion:nil];

}

- (IBAction)wireTransferAutoFlowTapped {
    if ([self selectedConnection] == nil ) { return; }
    DAPIAutoFlowVC *autoflow = [[DAPIAutoFlowVC alloc] initWithBankConnection:[self selectedConnection]
                                                                      account:nil
                                                              wireBeneficiary:[self wireBeneficiary]
                                                                  beneficiary:nil
                                                                 transferType:DAPITransferTypeWire
                                                                       amount:0
                                                                       remark:@"remark"];
    [autoflow setAutoFlowDelegate:self];
    [self presentViewController:autoflow animated:YES completion:nil];
    
}


-( DAPIBeneficiary* ) beneficiary {
    DAPIBeneficiary *beneficiary = [[DAPIBeneficiary alloc] init];
    DAPILineAddress *lineAddress = [[DAPILineAddress alloc] init];
    lineAddress.line1 = @"baniyas road";
    lineAddress.line2 = @"dubai";
    lineAddress.line3 = @"united arab emirates";
    beneficiary.linesAddress =  lineAddress;
    beneficiary.accountNumber = @"1647518280840289401662";
    beneficiary.bankName = @"STANDARD CHARTERED BANK";
    beneficiary.swiftCode = @"SCBLAEAD";
    beneficiary.iban = @"DAPIBANKAEHSBC1647518280840289401662";
    beneficiary.country = @"AE";
    beneficiary.branchAddress = @"Dubai Mall";
    beneficiary.branchName = @"Dubai Mall";
    beneficiary.phoneNumber = @"xxxxxxxxxxx";
    beneficiary.name = @"Mohammed Ennabah SC";
    return beneficiary;
    
}

-( DAPIWireBeneficiary* ) wireBeneficiary {
    DAPIWireBeneficiary *beneficiary = [[DAPIWireBeneficiary alloc] init];
    DAPILineAddress *lineAddress = [[DAPILineAddress alloc] init];
    lineAddress.line1 = @"baniyas road";
    lineAddress.line2 = @"dubai";
    lineAddress.line3 = @"united arab emirates";
    beneficiary.linesAddress =  lineAddress;
    beneficiary.accountNumber = @"1234567654321";
    beneficiary.name = @"TestAccount";
    beneficiary.country = @"US";
    beneficiary.receiverType = @"retail";
    beneficiary.routingNumber = @"953349354";
    beneficiary.nickname = @"JohnDoe";
    beneficiary.receiverAccountType = @"checking";
    beneficiary.firstName = @"John";
    beneficiary.lastName = @"Doe";
    beneficiary.zipCode = @"72305";
    beneficiary.state = @"Arkansas";
    beneficiary.city = @"Conway";
    return beneficiary;
    
}

- (IBAction)createBankBeneficiaryTapped {
    if ([self selectedConnection] == nil ) { return; }
    
    [Dapi.shared createBeneficiaryWithBankConnection:[self selectedConnection]
                                  beneficiaryDetails:[self beneficiary]
                                          completion:^(DAPIResponseResult * _Nullable response, NSError * _Nullable error) {
        NSLog(@"[DAPI] Success userID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
    
}

- (IBAction)createBankWireBeneficiaryTapped {
    if ([self selectedConnection] == nil ) { return; }
    [Dapi.shared createWireBeneficiaryWithBankConnection:[self selectedConnection]
                                      beneficiaryDetails:[self wireBeneficiary]
                                              completion:^(DAPIResponseResult * _Nullable response, NSError * _Nullable error) {
        NSLog(@"[DAPI] Success userID : %@",response.operationID);
        NSLog(@"[DAPI] Success response : %@",response);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorMessage);
        NSLog(@"[DAPI] Error: %@", error.dapiErrorType);
        NSLog(@"[DAPI] Error: %@", error.dapiOperationID);
    }];
    
}


@end

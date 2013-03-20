//
//  AGLEstablishmentDetailsViewController.m
//  Agecel
//
//  Created by Gilmar Araujo on 3/17/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLEstablishmentDetailsViewController.h"
#import "AGLAddressService.h"
#import "AGLAddress.h"

@interface AGLEstablishmentDetailsViewController ()

@end

@implementation AGLEstablishmentDetailsViewController
@synthesize establishment, addressesFromEstrablishment;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@", establishment.nameEstablishment];

    // Pega todos os enderecos de um estabelecimento
    self.addressesFromEstrablishment = [[NSMutableArray alloc] initWithArray:[AGLAddressService getAddressesFromEstablishment:self.establishment]];
  
  
    NSLog(@"Numero de endereços encontrados e de : %d", [addressesFromEstrablishment count]);
  
    AGLAddress *address = [[AGLAddress alloc] init];
    address = [addressesFromEstrablishment objectAtIndex:0]; // só pegando um endereço # PODE HAVER MAIS DE UM, ASSIM E PRECISO TRATAR
    street.text = address.street;
    number.text = [NSString stringWithFormat:@"%d", address.number];
    complement.text = address.complement;
    zip.text = address.zip;
    neighborhood.text = address.neighborhood;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

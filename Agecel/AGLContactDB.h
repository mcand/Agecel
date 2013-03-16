//
//  AGLContactDB.h
//  Agecel
//
//  Created by Andre Furquim on 3/15/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLSQLiteHelper.h"
#import "AGLContact.h"
#import "AGLEstablishment.h"

@interface AGLContactDB : AGLSQLiteHelper {
  
}
  // Retorna o SQL para criar um contato
  -(NSString *)getSQLCreate;
  
  // Salva um novo contato ou atualiza um já existe pelo id
  -(void) saveContact:(AGLContact *)contact;
  
  // Deleta todos os contatos
  -(void) deleteContacts;
  
  // Retorna todos os tipos de estabelecimento de uma cidade
  -(NSMutableArray *) getContactsFromEstablishment:(AGLEstablishment *)establishment;

@end

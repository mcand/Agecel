//
//  AGLTypeEstablishmentDB.m
//  Agecel
//
//  Created by Gilmar Araujo on 2/19/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLTypeEstablishmentDB.h"
#import "AGLTypeEstablishment.h"

@implementation AGLTypeEstablishmentDB

-(NSString *)getSQLCreate{
    NSString *sql = @"create table if not exists type_establishment (id_type_establishment integer primary key autoincrement, type_name_establishment text);";
    return sql;
}

// Salva um novo tipo de estabelecimento ou atualiza um já que existe
-(void) saveTypeEstablishment:(AGLTypeEstablishment *)establishmentType{
    char *sql = "insert or replace into type_establishment (id_type_establishment, type_name_establishment) values (?, ?);";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if(resultado == SQLITE_OK){
        //se for nulo insere, senão atualiza
        if(establishmentType.idTypeEstablishment > 0){
           //informa o id para fazer o update
            sqlite3_bind_int(stmt, 1, establishmentType.idTypeEstablishment);
        }
        sqlite3_bind_text(stmt, 2, [establishmentType.typeNameEstablishment UTF8String], -1, nil);
        //executa o sql
        resultado = sqlite3_step(stmt);
        
        if (resultado == SQLITE_DONE) {
            NSLog(@"Tipo de estabelecimento %@ inserido com sucesso.", establishmentType.typeNameEstablishment);
        }
        sqlite3_finalize(stmt);
    }else{
        NSLog(@"Erro ao inserir o tipo de estabelecimento %@!", establishmentType.typeNameEstablishment);
    }
    return;
}


// Deleta todos os tipos de estabelecimentos de um estado
-(void) deleteTypeEstablishmentsFromState:(AGLState *)state{

}

// Deleta todos os tipos estabelecimentos
-(void) deleteTypeEstablishments{
    char *sql = "delete from type_establishment;";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if (resultado == SQLITE_DONE) {
        NSLog(@"Todas os tipos de nome de estabelecimentos de type_establishment foram deletados!");
    }
    sqlite3_finalize(stmt);
}

@end
    
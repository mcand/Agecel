//
//  AGLTypeNameEstablishmentDB.m
//  Agecel
//
//  Created by Gilmar Araujo on 2/24/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLTypeNameEstablishmentDB.h"
#import "AGLTypeNameEstablishment.h"

@implementation AGLTypeNameEstablishmentDB


-(NSString *)getSQLCreate{
    NSString *sql = @"create table if not exists type_name_establishment (id_type_name_establishment integer primary key autoincrement, type_name_establishment text);";
       return sql;
}

// Salva um novo estado ou atualiza um já existe 
-(void) saveTypeNameEstablishment:(AGLTypeNameEstablishment *)establishmentTypeName{
    char *sql = "insert or replace into type_name_establishment (id_type_name_establishment, type_name_establishment) values (?, ?);";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if(resultado == SQLITE_OK){
        //se for nulo insere, senão atualiza
        if(establishmentTypeName.idTypeNameEstablishment > 0){
            //informa o id para fazer o update
            sqlite3_bind_int(stmt, 1, establishmentTypeName.idTypeNameEstablishment);
        }
        sqlite3_bind_text(stmt, 2, [establishmentTypeName.typeNameEstablishment UTF8String], -1, nil);
        //executa o sql
        resultado = sqlite3_step(stmt);
        
        if (resultado == SQLITE_DONE) {
            NSLog(@"Nome do Tipo de estabelecimento inserido com sucesso");
        }
        sqlite3_finalize(stmt);
    }else{
        NSLog(@"Erro ao inserir o nome do tipo de estabelecimento");
    }

}

// Deleta todos os tipos estabelecimentos
-(void) deleteTypeEstablishments{
    char *sql = "delete from type_name_establishment;";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if (resultado == SQLITE_DONE) {
        NSLog(@"Deletado com sucesso!");
    }
    sqlite3_finalize(stmt);
}

//esta funcionalidade será colocada na Establishment
// Retorna todos os tipos de estabelecimento de uma cidade
-(NSMutableArray *) getTypeNameEstablishmentsFromCity:(AGLCity *)city{
    // Array que vai armazenar a lista de tipos de estabelecimento
    NSMutableArray *establishmentTypesNameOfCity = [[NSMutableArray alloc] init];
    // SQL para selecionar as cidades
    NSString *query = @"select id_type_establishment, id_city, id_type_name_establishment from type_establishment order by id_type_establishment;";
    sqlite3_stmt *stmt;
    // cria o stmt
    int resultado = sqlite3_prepare_v2(bancoDeDados,[query UTF8String], -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
/*            AGLTypeEstablishment *aTypeOfEstablishment = [[AGLTypeEstablishment alloc] init];
            aTypeOfEstablishment.id_type_establishment = sqlite3_column_int(stmt, 0);
            aTypeOfEstablishment.id_city = sqlite3_column_int(stmt, 1);
            aTypeOfEstablishment.id_type_name_establishment = sqlite3_column_int(stmt, 2);
            [establishmentTypesOfCity addObject:aTypeOfEstablishment];*/
        }
        // Finaliza o cursor
        sqlite3_finalize(stmt);
    }
    return establishmentTypesNameOfCity;

}

@end

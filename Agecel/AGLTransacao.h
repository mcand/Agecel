//
//  AGLTransacao.h
//  Agecel
//
//  Created by Andre Furquim on 2/3/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AGLTransacao <NSObject>

-(void)transacaoExecutar;
// Este método vai executar na thread principal - UIThread
-(void)transacaoAtualizarInterface;
@end

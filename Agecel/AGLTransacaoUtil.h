//
//  AGLTransacaoUtil.h
//  Agecel
//
//  Created by Andre Furquim on 2/3/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGLTransacao.h"

@interface AGLTransacaoUtil : NSObject {
  NSOperationQueue *queue;
}

-(void)iniciarTransacao:(NSObject<AGLTransacao> *)transacao;
@property (nonatomic, retain) NSObject<AGLTransacao> *transacao;

@end

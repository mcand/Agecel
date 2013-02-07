//
//  AGLTransacaoUtil.m
//  Agecel
//
//  Created by Andre Furquim on 2/3/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLTransacaoUtil.h"

//
//  TransacaoUtil.m
//  Carros
//
//  Created by Andre Furquim on 1/22/13.
//  Copyright (c) 2013 Andre Furquim. All rights reserved.
//

#import "AGLTransacaoUtil.h"

@implementation AGLTransacaoUtil
@synthesize transacao = _transacao;
-(void)iniciarTransacao:(NSObject<AGLTransacao> *)transacao {
  self.transacao = transacao;
  if (!queue) {
    queue = [[NSOperationQueue alloc] init];
  }
  [queue cancelAllOperations];
  // Dispara o doenload em uma NSOperation
  NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(executeOnBackground) object:nil];
  [queue addOperation:operation];
}
#pragma mark - transacao
// Executa em uma thread
-(void) executeOnBackground {
  [self.transacao transacaoExecutar];
  [self performSelectorOnMainThread:@selector(executeOnUIThread) withObject:nil waitUntilDone:YES];
}

// Executa na thread principal
-(void) executeOnUIThread {
  [self.transacao transacaoAtualizarInterface];
}


@end


## 
# @file  binary-operator.R
# @brief R file implementing binary operators
#
# @author Christophe Dutang
#
#
#
# The new BSD License is applied to this software.
# Copyright (c) 2022 Christophe Dutang. 
# Christophe Dutang, see http://dutangc.free.fr
# All rights reserved.
#
#      Redistribution and use in source and binary forms, with or without
#      modification, are permitted provided that the following conditions are
#      met:
#      
#          - Redistributions of source code must retain the above copyright
#          notice, this list of conditions and the following disclaimer.
#          - Redistributions in binary form must reproduce the above
#          copyright notice, this list of conditions and the following
#          disclaimer in the documentation and/or other materials provided
#          with the distribution.
#          - Neither the name of the ETH Zurich nor the names of its 
#          contributors may be used to endorse or promote 
#          products derived from this software without specific prior written
#          permission.
#     
#      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#      A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#      OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#      LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#      DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#      THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#      (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#      OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#  
#
#############################################################################
### binary operators
###
###			R functions
### 

int2bit <- function(x)
  as.numeric(intToBits(x))
bit2int <- function(x)
  sum(x * 2^(1:length(x)-1))
bit2unitreal <- function(x) #radical inverse function in base 2
  sum(x / 2^(1:length(x)))
oplus <- function(x,y)
{
  stopifnot(NCOL(x)==1)
  stopifnot(NCOL(y)==1)
  if(length(x) > length(y))
    y <- c(y, rep(0, length(x)-length(y)))
  if(length(x) < length(y))
    x <- c(x, rep(0, length(y)-length(x)))           
  (x+y) %% 2
}


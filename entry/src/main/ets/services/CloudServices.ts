/*
 * Copyright (c) StarHidden2846@gmail.com Last Update: 2024-07-17 11:54:26. All Rights Reserved.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * Neither the name of the developer nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 重新分发和使用源代码和二进制形式的代码，无论是否进行修改，都是允许的，只要满足以下条件：
 * 重新分发源代码时，必须保留上述版权通知、本条件列表以及以下免责声明。
 * 以二进制形式重新分发时，必须在分发时提供的文档或其他材料中复制上述版权通知、本条件列表以及以下免责声明。
 * 未经事先书面许可，不得使用开发者或贡献者的名称来认可或推广从本软件派生出来的产品。
 */
import agconnect from '@hw-agconnect/api-ohos'
import '@hw-agconnect/core-ohos'
import '@hw-agconnect/function-ohos'

/**
 * 添加用户
 */
export const addUser = async (payload)=>{
  const functionCallable = agconnect.function().wrap("user-$latest")
  //拿到结果
  const result =await functionCallable.call({
    action: 'add',
    payload
  })
  return result.getValue()
}
/**
 * 查询用户
 */
export const queryUser = async (payload)=>{
  const functionCallable = agconnect.function().wrap("user-$latest")
  //拿到结果
  const result =await functionCallable.call({
    action: 'query',
    payload
  })
  return result.getValue()
}
/**
 * 修改用户信息
 */
export const patchUser = async (payload)=>{
  const functionCallable = agconnect.function().wrap("user-$latest")
  //拿到结果
  const result =await functionCallable.call({
    action: 'patch',
    payload
  })
  return result.getValue()
}
/**
 * 添加银行卡
 */
export const addBankCard = async (payload)=>{
  const functionCallable = agconnect.function().wrap("add-card-$latest")
  //拿到结果
  const result =await functionCallable.call({
    action: 'add',
    payload
  })
  return result.getValue()
}
/**
 * 查询银行卡
 */
export const queryBankCard = async (payload)=>{
  const functionCallable = agconnect.function().wrap("add-card-$latest")
  //拿到结果
  const result =await functionCallable.call({
    action: 'query',
    payload
  })
  return result.getValue()
}

export const onPay = async (payload)=>{
  const functionCallable = agconnect.function().wrap("pay-records-$latest")
  const result =await functionCallable.call({
    action: 'add',
    payload
  })
  return result.getValue()
}
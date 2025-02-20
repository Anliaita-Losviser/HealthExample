/*
 * Copyright (c) StarHidden2846@gmail.com Last Update: 2024-07-16 11:54:54. All Rights Reserved.
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
import router from '@ohos.router'
import Notification from '@system.notification'
import { FontSizes } from '../common/CommonStyles'
import { InputWidget } from '../components/Input'
import { CommonTitle, FunctionTitleComponent } from '../components/TitleComponent'
import { User } from '../models/userData'
import { patchUser } from '../services/CloudServices'
import UserModel from '../viewModels/UserViewmodel'

@Entry
@Component
struct EditPersonPage {
  @State userInfo: User = new User()
  async onPageShow(){
    try {
      UserModel.getUserInfo().then((data)=>{
        this.userInfo = data
      }).catch(error => {console.error(error)})
    }catch (error){
      console.error(error,'错误')
    }
  }
  build() {
    Column(){
      //标题
      FunctionTitleComponent({ title: $r('app.string.edit_my_page_title'),
        leftButton: $r('app.media.chevron_left'),
        leftFunc: ()=>{
          router.back()
        },
        fontWeight:FontWeight.Bold}).width(360)
      //头像
      Image($r('app.media.person_crop_circle_fill_1'))
        .width(96).height(96)
      //小标题“个人信息”
      CommonTitle({title: $r('app.string.my_page_title'),
        fontWeight: FontWeight.Bold,
        fontSize:FontSizes.Third,
        alignWay: FlexAlign.Start,
        topMargin: 16,
        bottomMargin: 8}).width(320)
      //表单，姓名、电话、邮箱、出生日期、性别
      InputWidget({title: $r('app.string.owner_name'),
        defaultValue: this.userInfo.name,
        change: (val)=>{
          this.userInfo.name = val
        }}).margin({top: 8})
      InputWidget({title: $r('app.string.edit_my_page_phoneNumber'),
        defaultValue: this.userInfo.phone,
        change: (val)=>{
          this.userInfo.phone = val
        }}).margin({top: 8})
      InputWidget({title: $r('app.string.edit_my_page_email'),
        defaultValue: this.userInfo.email,
        change: (val)=>{
          this.userInfo.email = val
        }}).margin({top: 8})
      //确认、取消按钮
      Row(){
        Button($r('app.string.edit_page_cancel'))
          .width(120).height(36).margin({ top: 16, bottom: 16 })
          .backgroundColor($r('app.color.background_secondary'))
          .fontColor($r('app.color.theme_red'))
          .onClick(()=>{
            router.back()
          })
        Button($r('app.string.edit_page_confirm'))
          .width(120).height(36).margin({ top: 16, bottom: 16 })
          .backgroundColor($r('app.color.theme_red'))
          .onClick(async ()=>{
            await patchUser(this.userInfo)
            Notification.show({
              contentTitle:'修改成功'
            })
            setTimeout(()=>router.back(),1000)
          })
      }.width('100%').justifyContent(FlexAlign.SpaceEvenly)
    }.width('100%').height('100%').alignItems(HorizontalAlign.Center)
  }
}
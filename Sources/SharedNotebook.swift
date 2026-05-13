import SwiftUI

// 这是 1 本被左右面板共同持有的共享笔记本。
final class SharedNotebook: ObservableObject {
  // 当前共享草稿内容。
  @Published var draft: String

  // 初始化默认草稿。
  init(draft: String = "这里是共享草稿。左右两边改的是同 1 份。") {
    // 保存初始草稿。
    self.draft = draft
  }

  // 写入会议纪要模板。
  func writeMeetingTemplate() {
    // 改共享草稿。
    draft = "会议纪要：周三评审通过，搜索栏保留，预览区支持直接编辑。"
  }

  // 写入报销提醒模板。
  func writeExpenseTemplate() {
    // 改共享草稿。
    draft = "报销提醒：发票、行程单、付款截图，缺一不可。"
  }

  // 清空草稿。
  func clear() {
    // 直接清空共享文本。
    draft = ""
  }

  // 返回对象身份字符串。
  var identityText: String {
    // 用 ObjectIdentifier 证明左右拿的是同 1 个对象。
    String(describing: ObjectIdentifier(self))
  }
}

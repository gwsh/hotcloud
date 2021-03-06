class Global {
  final bool isDebug = false;
  final ModelType model = ModelType.pro;
}

/// pro环境：生产环境，面向外部用户的环境，连接上互联网即可访问的正式环境。
/// pre环境：灰度环境，外部用户可以访问，但是服务器配置相对低，其它和生产一样。
/// test环境：测试环境，外部用户无法访问，专门给测试人员使用的，版本相对稳定。
/// dev环境：开发环境，外部用户无法访问，开发人员使用，版本变动很大。
enum ModelType {
  dev,
  pro,
  pre,
  test,
}

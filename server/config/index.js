const devMode = process.env.NODE_ENV === 'development'

const config = {
  PORT: 3001, // 启动端口
  ADMIN_GITHUB_LOGIN_NAME: 'minyuehe', // 博主的 github 登录的账户名 user
  GITHUB: {
    client_id: '6180ab15a59251b3c43c',
    client_secret: 'a9c178a018a96a18976972a9b04117d45473d1cb',
    access_token_url: 'http://github.com/login/oauth/access_token',
    fetch_user_url: 'http://api.github.com/user', // 用于 oauth2
    fetch_user: 'http://api.github.com/users/', // fetch user url https://api.github.com/users/gershonv
  },
  EMAIL_NOTICE: {
    // 邮件通知服务
    // detail: https://nodemailer.com/
    enable: true, // 开关
    transporterConfig: {
      host: 'smtp.163.com',
      port: 465,
      secure: true, // true for 465, false for other ports
      auth: {
        user: 'guodadablog@163.com', // generated ethereal user
        pass: '123456', // generated ethereal password 授权码 而非 密码
      },
    },
    subject: '郭大大的博客 - 您的评论获得新的回复！', // 主题
    text: '您的评论获得新的回复！',
    WEB_HOST: 'http://127.0.0.1:80', // email callback url
  },
  TOKEN: {
    secret: 'minyue-test', // secret is very important!
    expiresIn: '720h', // token 有效期
  },
  DATABASE: {
    database: 'iot',
    user: 'root',
    password: 'minyuecmhe',
    options: {
      host: '10.13.49.143', // 连接的 host 地址
      dialect: 'mysql', // 连接到 mysql
      pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000,
      },
      define: {
        timestamps: false, // 默认不加时间戳
        freezeTableName: true, // 表名默认不加 s
      },
      timezone: '+08:00',
    },
  },
}

// 部署的环境变量设置
if (!devMode) {
  console.log('env production....')

  // ==== 配置数据库
  config.DATABASE = {
    ...config.DATABASE,
    database: 'iot',
    user: 'root',
    password: 'minyuecmhe',
  }

  // 配置 github 授权
  config.GITHUB.client_id = '6180ab15a59251b3c43c'
  config.GITHUB.client_secret = 'a9c178a018a96a18976972a9b04117d45473d1cb'

  // ==== 配置 token 密钥
  config.TOKEN.secret = 'minyue-test'

  // ==== 配置邮箱

  // config.EMAIL_NOTICE.enable = true
  config.EMAIL_NOTICE.transporterConfig.auth = {
    user: 'guodadablog@163.com', // generated ethereal user
    pass: '123456XXX', // generated ethereal password 授权码 而非 密码
  }
  config.EMAIL_NOTICE.WEB_HOST = 'https://minyuehe.github.io'
}

module.exports = config

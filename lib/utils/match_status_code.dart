class MatchStatusCode {
  static const ftMatchStatus = {
    0: '比赛异常',
    1: '未开赛',
    2: '上半场',
    3: '中场',
    4: '下半场',
    5: '加时赛',
    6: '加时赛(弃用)',
    7: '点球决战',
    8: '完场',
    9: '推迟',
    10: '中断',
    11: '腰斩',
    12: '取消',
    13: '待定',
  };

  static const ftTechTotal = {
    1: '进球',
    2: '角球',
    3: '黄牌',
    4: '红牌',
    5: '界外球',
    6: '任意球',
    7: '球门球',
    8: '点球',
    9: '换人',
    10: '比赛开始',
    11: '中场',
    12: '结束',
    13: '半场比分',
    15: '两黄变红',
    16: '点球未进',
    17: '乌龙球',
    19: '伤停补时',
    21: '射正',
    22: '射偏',
    23: '进攻',
    24: '危险进攻',
    25: '控球率',
    26: '加时赛结束',
    27: '点球大战结束',
    28: 'VAR(视频助理裁判)',
    29: '点球(点球大战)', // （type_v2字段返回）
    30: '点球未进(点球大战)', //（type_v2字段返回）
  };
}
//
//  OKKLineSwift
//
//  Copyright © 2016年 Herb - https://github.com/Herb-Sun/OKKLineSwift
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#if os(iOS) || os(tvOS)
    import UIKit
#else
    import Cocoa
#endif

/// K线类型
public enum OKKLineType: Int {
    case KLine // K线
    case timeLine // 分时图
    case other // 其他
}

/// 指标种类
public enum OKIndicatorType {
    case NONE
    case MA([Int])
    case MA_VOLUME([Int])
    case EMA([Int])
    case EMA_VOLUME([Int])
    case DIF, DEA, MACD
    case KDJ, KDJ_K, KDJ_D, KDJ_J
    case BOLL(Int), BOLL_MB, BOLL_UP, BOLL_DN
    case RSI
    case VOL
    case DMI
}

/// 时间线分隔
public enum OKTimeLineType: Int {
    case realTime = 1 // 分时
    case oneMinute = 60 // 1分
    case fiveMinute = 300 // 5分
    case fifteenMinute = 900 // 15分
    case thirtyMinute = 1800 // 30分
    case oneHour = 3600 // 60分
    case oneDay = 86400 // 日
    case oneWeek = 604800 // 周
}

public final class OKConfiguration {
    
    private init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
    }
    
    public static let shared = OKConfiguration()
    
    // MARK: - Common
    public var dateFormatter: DateFormatter
    
    public let dataSource: OKDataSource = OKDataSource()
    
    /// 全局主题
    public let theme: OKTheme = OKTheme()
    
    /// 主图Configuration(main)
    public let main: OKMainConfiguration = OKMainConfiguration()
    
    /// 成交量图Configuration(volume)
    public let volume: OKVolumeConfiguration = OKVolumeConfiguration()
    
    /// 指标图Configuration(accessory)
    public let accessory: OKAccessoryConfiguration = OKAccessoryConfiguration()
    
    /// 价格视图Configuration(value)
    public let value: OKValueConfiguration = OKValueConfiguration()
    
}

public class OKDataSource {
    
    public var drawRange: NSRange?
    public var klineModels = [OKKLineModel]()
    public var drawKLineModels = [OKKLineModel]()
}

// MARK: - 皮肤主题
public class OKTheme {
    
    // MARK: K线主题
    
    /// 涨的颜色
    public var increaseColor: OKColor = OKColor(hexRGB: 0xFF5353)
    
    /// 跌的颜色
    public var decreaseColor: OKColor = OKColor(hexRGB: 0x00B07C)
    
    /// k线的间隔
    public var klineSpace: CGFloat = 1.0
    
    /// k线图主体宽度
    public var klineWidth: CGFloat = 5.0
    
    /// 上下影线宽度
    public var klineShadowLineWidth: CGFloat = 1.0
    
    /// k线最大宽度
    public var klineMaxWidth: CGFloat = 20.0
    
    /// k线最小宽度
    public var klineMinWidth: CGFloat = 2.0
    
    /// k线缩放界限
    public var klineScale: CGFloat = 0.03
    
    /// k线缩放因子
    public var klineScaleFactor: CGFloat = 0.03
    
    /// 指标线宽度
    public var indicatorLineWidth: CGFloat = 0.8

    /// 十字线颜色
    public var longPressLineColor: OKColor = OKColor(hexRGB: 0xE1E2E6)
    
    /// 十字线宽度
    public var longPressLineWidth: CGFloat = 0.5
    
    // MARK: 指标颜色
    
    public var DIFColor: OKColor = OKColor(hexRGB: 0xFF8D1D)
    public var DEAColor: OKColor = OKColor(hexRGB: 0x0DAEE6)
    public var MACDColor: OKColor = OKColor(hexRGB: 0xFFC90E)
    
    public var KDJ_KColor: OKColor = OKColor(hexRGB: 0xFF8D1D)
    public var KDJ_DColor: OKColor = OKColor(hexRGB: 0x0DAEE6)
    public var KDJ_JColor: OKColor = OKColor(hexRGB: 0xE970DC)
    
    public var BOLL_MBColor: OKColor = OKColor(hexRGB: 0xFFAEBF)
    public var BOLL_UPColor: OKColor = OKColor(hexRGB: 0xFFC90E)
    public var BOLL_DNColor: OKColor = OKColor(hexRGB: 0x0DAEE6)
    
    public func MAColor(day: Int) -> OKColor {
        return OKColor(hexRGB: 0x4498EA + day)
    }
    
    public func EMAColor(day: Int) -> OKColor {
        return OKColor(hexRGB: 0x4498EA + day)
    }
}

// MARK: - 主图Configuration(main)

public class OKMainConfiguration {
    
    /// 主图图表的背景色
    public var backgroundColor: OKColor = OKColor(hexRGB: 0x181C20)
    
    /// 主图比例
    public var scale: CGFloat = 0.50
    
    /// 主图顶部提示信息高度
    public var topAssistViewHeight: CGFloat = 30.0
    
    /// 主图底部时间线信息高度
    public var bottomAssistViewHeight: CGFloat = 15.0
    
    /// 时间线
    public var timeLineType: OKTimeLineType = .realTime
    
    /// 主图K线类型
    public var klineType: OKKLineType = .KLine
    
    /// 主图分时线宽度
    public var realtimeLineWidth: CGFloat = 1.0
    
    /// 分时线颜色
    public var realtimeLineColor: OKColor = OKColor(hexRGB: 0xFFFFFF)
    
    /// 主图指标类型
    public var indicatorType: OKIndicatorType = .MA([12, 26])
    
    /// 辅助视图背景色(e.g. 日期的背景色)
    public var assistViewBgColor: OKColor = OKColor(hexRGB: 0x1D2227)
    
    /// 辅助视图字体颜色(e.g. 日期的字体颜色)
    public var assistTextColor: OKColor = OKColor(hexRGB: 0x565A64)
    
    /// 辅助视图字体大小(e.g. 日期的字体大小)
    public var assistTextFont: OKFont = OKFont.systemFont(ofSize: 11)
}

// MARK: - 成交量图Configuration(volume)

public class OKVolumeConfiguration {
    
    /// 是否显示成交量视图
    public var show: Bool = true
    
    /// 成交量视图背景色
    public var backgroundColor: OKColor = OKColor(hexRGB: 0x181C20)
    
    /// 成交量比例
    public var scale: CGFloat = 0.25
    
    /// 顶部提示信息高度
    public var topViewHeight: CGFloat = 20.0
    
    /// 成交量图分时线宽度
    public var lineWidth: CGFloat = 0.5
    
    /// 成交量指标类型
    public var indicatorType: OKIndicatorType = .EMA_VOLUME([12, 26])
}

// MARK: - 指标图Configuration(accessory)

public class OKAccessoryConfiguration {
    
    /// 是否显示指标图
    public var show: Bool = true
    
    /// 指标视图背景色
    public var backgroundColor: OKColor = OKColor(hexRGB: 0x181C20)
    
    /// 指标图比例
    public var scale: CGFloat = 0.25
    
    /// 顶部提示信息高度
    public var topViewHeight: CGFloat = 20.0
    
    /// 指标图分时线宽度
    public var lineWidth: CGFloat = 0.5
    
    /// 辅助图指标类型
    public var indicatorType: OKIndicatorType = .MACD
}

// MARK: - 价格视图Configuration(value)

public class OKValueConfiguration {
    
    public var backgroundColor: OKColor = OKColor(hexRGB: 0x181C20)
    public var textFont: OKFont = OKFont.systemFont(ofSize: 11)
    public var textColor: OKColor = OKColor(hexRGB: 0xDCDADC)
}

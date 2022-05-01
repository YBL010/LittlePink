//
//  HomeVC.swift
//  LittlePink
//
//  Created by 金慕煙 on 2022/5/1.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        
        // MARK: 设置上方的bar、按钮、条的UI
        
        // 1.整体bar--在sb上设
        
        
        // 2.selectedBar--按钮下方的条
        
        
        //selectedBar--按钮下方条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        //清除原来的颜色
        settings.style.buttonBarItemBackgroundColor = .clear
        
        //调节字体大小
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        //移动条的长度为:字体.width+buttonBarItemLeftRightMargin * 2
        settings.style.buttonBarItemLeftRightMargin = 0
        
        super.viewDidLoad()
        
        //在最左或最右页面不能往左或右继续移动
        containerView.bounces = false

        //未选中标题（关注、发现、附近）文字颜色为灰色
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }
        
        //启动后显示在第2个tab页，即“发现”页而不是“关注”页
        DispatchQueue.main.async {
            self.moveToViewController(at: 1, animated: false)
        }
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearbyVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        return [followVC, discoveryVC, nearbyVC]
    }

}


//  ViewController.swift
//  Accordion_Sample
//
//  Created by Satoshi Komatsu on 2019/07/20.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//
import UIKit

struct rail {
    var isShown: Bool
    var railName: String
    var stationArray: [String]
}

struct rail2 {
    var isShown: Bool
    var railName: String
    var stationArray: [String]
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    private let headerArray: [String] = ["あ", "か", "さ", "た","な", "は", "ま", "や","ら","わ"]
    private let AArray: [String] = ["アウトサイド","インサイド","インターフェア","エアリアル・エアボーン","エッジ","オフザトップ","オフショア"]
    private let KAArray: [String] = ["風波","カレント","カール", "ガン","カール","キックアウト","クローズアウト","グラッシー","グリーンルーム","グーフィー"]
    private let SAArray: [String] = ["シェイパー","シャロー","ショアブレイク","ショート・ボード","スウェル","スケッグ・フィン","ストリンガー","スプーキー・ウェイディー","スラローム","スロープ","スープ"]
    private let TAArray: [String] = ["ダッグダイブ（ドルフィンスルー）","チョッピー","チャンネル","テール","トライフィン"]
    private let NAArray: [String] = ["ニーリング・ニーパドル","ノーズ"]
    private let HAArray: [String] = ["パドリング","パーリング","ビーチブレイク","ファンボード","フェイス","フラット","プルアウト","ボトム"]
    private let MAArray: [String] = ["マニューバー"]
    private let YAArray: [String] = [""]
    private let RAArray: [String] = ["ライディング","ラッシュガード","リペア","リーシュ","ロング・ボード","ロングライディング","ロッカー","ローカル"]
    private let WAArray: [String] = ["ワイプアウト","ワックス"]
    private lazy var courseArray = [
        rail(isShown: true, railName: self.headerArray[0], stationArray: self.AArray),
        rail(isShown: false, railName: self.headerArray[1], stationArray: self.KAArray),
        rail(isShown: false, railName: self.headerArray[2], stationArray: self.SAArray),
        rail(isShown: false, railName: self.headerArray[3], stationArray: self.TAArray),
        rail(isShown: false, railName: self.headerArray[4], stationArray: self.NAArray),
        rail(isShown: false, railName: self.headerArray[5], stationArray: self.HAArray),
        rail(isShown: false, railName: self.headerArray[6], stationArray: self.MAArray),
        rail(isShown: false, railName: self.headerArray[7], stationArray: self.YAArray),
        rail(isShown: false, railName: self.headerArray[8], stationArray: self.RAArray),
        rail(isShown: false, railName: self.headerArray[9], stationArray: self.WAArray)
    ]
    
    private let detailheaderArray: [String] = ["あ", "か", "さ", "た","な", "は", "ま", "や","ら","わ"]
    private let detailAArray: [String] = ["波がブレイクしはじめている沖のエリアのこと。","岸に近い海のこと。","波に乗るサーファーの進路を邪魔する行為。","波を飛び出して空中で決める技。","ボードのレールやボトムにある角度のこと。","鋭いボトムターンから波のトップへ向かい、ターンを くり出すテクニックのこと。","岸から沖に向かって吹く風のこと。オンショアはその逆。"]
    private let detailKAArray: [String] = ["うねりではなく、風の影響で立った波のこと。","海の中の潮の流れ。","カール", "ビックウエイブ用に作られたサーフボード。","波の先端が巻いている状態。","プルアウトの一種でボードを蹴り出して波の上に飛び出すこと。","波のサイズが大きくなりすぎ、波が左右に徐々に崩れずに一度に崩れてしまう状態。","無風状態の時、波の面がツルツルで、ガラスのような状態。","チューブの中の空間のこと。","岸から見て、左から右に向かって徐々に崩れていく波。"]
    private let detailSAArray: [String] = ["サーフボードを作っている職人さん。","浅瀬のこと。","波打ち際でブレイクする波。","6.11ftまでの長さのボード。","うねり。","サーフボードのボトムのテールよりについている舵のこと。","サーフボードの中心にある木製の薄い板。","風が強い状態。","大きなカーブを描きながら連続ターンをすること。","波の斜面のこと。","波が崩れた後に出来る白い泡立った波の事。"]
    private let detailTAArray: [String] = ["沖を目指す際に波の下をくぐり抜けてかわす行為。カッコ内は日本特有の呼び名。","強いオンショアにより海面が白くさざ波立ってしまうこと。","ボードのボトムについた溝。","ボードの後端部。","フィンが３つ付いているサーフボード。"]
    private let detailNAArray: [String] = ["ボード上に正座してパドルする方法。","ボードの先端部。"]
    private let detailHAArray: [String] = ["沖に出るために漕ぎ出す行為。","テイクオフしたときにボードの先端から、波に突っこんでしまうこと。","海底の地質が砂のポイントのこと。","長さが７ft〜8.11ftまでのボード。","波の斜面のこと。","波が全くない状態。","乗っている波から降りて、ライディングを止めること。","サーフボードの接水面。"]
    private let detailMAArray: [String] = ["ライディングによって、波のフェイスに描くラインのこと。"]
    private let detailYAArray: [String] = [""]
    private let detailRAArray: [String] = ["波に乗る行為。","体の擦れや日射しから体を守る薄手の衣類。","修理すること。","ボードと体をつなぐコードのこと（別名　パワーコード）。","９ft以上の長さのあるボードのこと。","長く波に乗ること。","サーフボードの反り。","サーフポイントのそばに住む地元の人。"]
    private let detailWAArray: [String] = ["バランスを崩してボードから落ちること。","サーフボードのデッキに塗る滑り止め。"]
    private lazy var detailCourseArray = [
        rail2(isShown: true, railName: self.detailheaderArray[0], stationArray: self.detailAArray),
        rail2(isShown: false, railName: self.detailheaderArray[1], stationArray: self.detailKAArray),
        rail2(isShown: false, railName: self.detailheaderArray[2], stationArray: self.detailSAArray),
        rail2(isShown: false, railName: self.detailheaderArray[3], stationArray: self.detailTAArray),
        rail2(isShown: false, railName: self.detailheaderArray[4], stationArray: self.detailNAArray),
        rail2(isShown: false, railName: self.detailheaderArray[5], stationArray: self.detailHAArray),
        rail2(isShown: false, railName: self.detailheaderArray[6], stationArray: self.detailMAArray),
        rail2(isShown: false, railName: self.detailheaderArray[7], stationArray: self.detailYAArray),
        rail2(isShown: false, railName: self.detailheaderArray[8], stationArray: self.detailRAArray),
        rail2(isShown: false, railName: self.detailheaderArray[9], stationArray: self.detailWAArray)
    ]
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseArray[section].isShown ? courseArray[section].stationArray.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = courseArray[indexPath.section].stationArray[indexPath.row]
        
        return cell!
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return courseArray.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return courseArray[section].railName
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let popupDetailView: PopupDetailViewController = storyBoard.instantiateViewController(withIdentifier: "popupDetail") as! PopupDetailViewController
        popupDetailView.modalPresentationStyle = .overFullScreen
        popupDetailView.modalTransitionStyle = .crossDissolve

        popupDetailView.wordDetail = detailCourseArray[indexPath.section].stationArray[indexPath.row]
//            seasonsExplain.text!
        
        self.present(popupDetailView, animated: false, completion: nil)
        

    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(headertapped(sender:)))
        headerView.addGestureRecognizer(gesture)
        headerView.tag = section
        return headerView
    }

    @objc func headertapped(sender: UITapGestureRecognizer) {
        guard let section = sender.view?.tag else {
            return
        }
        courseArray[section].isShown.toggle()
        
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .automatic)
        tableView.endUpdates()
    }
}


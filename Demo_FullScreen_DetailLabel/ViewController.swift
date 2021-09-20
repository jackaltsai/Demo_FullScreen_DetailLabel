//
//  ViewController.swift
//  Demo_FullScreen_DetailLabel
//
//  Created by 蔡忠翊 on 2021/9/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
//        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
    }
    
    
    /* 範例 3: 圖文頁面 */
    // 方法 1: UICollectionViewCompositionalLayoutConfiguration 的 scrollDirection 設成 horizontal， collectionView 的 isPagingEnabled 設成 true
    // 書名 label 的 vertical content hugging 設為 252，vertical content compression 設為 751
    
//    func generateLayout() -> UICollectionViewLayout {
//        let inset: Double = 50
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        let configuration = UICollectionViewCompositionalLayoutConfiguration()
//        configuration.scrollDirection = .horizontal
//        return UICollectionViewCompositionalLayout(section: section, configuration: configuration)
//    }
        
    
    // 方法 2: orthogonalScrollingBehavior 設為 paging
    // orthogonalScrollingBehavior 設為 paging，利用 item 的 contentInsets 設定內容和邊界的間距。另外記得要將 collectionView 的 isScrollEnabled 設為 false，不然畫面還是可以垂直捲動
    // 書名 label 的 vertical content hugging 設為 252，vertical content compression 設為 751
    
    func generateLayout() -> UICollectionViewLayout {
        let inset: Double = 50
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "Image\(indexPath.item + 1)")
        
        cell.label.text = "Image\(indexPath.item + 1)"
        
        cell.detailLabel.text = "Image\(indexPath.item + 1) + detail\(indexPath.item + 1)"
        return cell
    }
    
    
}

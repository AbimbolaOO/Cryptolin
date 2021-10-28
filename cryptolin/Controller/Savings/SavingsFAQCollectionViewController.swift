//
//  SavingsFAQCollectionViewController.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 27/10/2021.
//

import UIKit

class SavingsFAQCollectionViewController: UICollectionViewController {
    
    private lazy var dataSource = makeDataSource()
    typealias DataSource = UICollectionViewDiffableDataSource<SavingsFAQsQuestion.Section, AnyHashable>
    
    init(){
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        super.init(collectionViewLayout: UICollectionViewCompositionalLayout.list(using: configuration))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Savings FAQs"
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backBarButtton
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        
        collectionView.backgroundColor = .red
        applySnapshot()
    }
    
    func makeDataSource() -> DataSource {
        let questionCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SavingsFAQsQuestion> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.textProperties.color = UIColor.systemBlue
            configuration.text = item.question
            
            cell.contentConfiguration = configuration
            let options = UICellAccessory.OutlineDisclosureOptions(style: .header, tintColor: UIColor.lightGray)
            let disclosureAccessory = UICellAccessory.outlineDisclosure(options: options)
            cell.accessories = [disclosureAccessory]
        }
        
        let answerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SavingsFAQsAnswer> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.answer
            cell.contentConfiguration = configuration
        }
     
      let datasource =  DataSource(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
          var cell: UICollectionViewCell?
          if let item = item as? SavingsFAQsQuestion{
              cell = collectionView.dequeueConfiguredReusableCell( using: questionCellRegistration, for: indexPath, item: item)
          }else if let item = item as? SavingsFAQsAnswer{
              cell = collectionView.dequeueConfiguredReusableCell( using: answerCellRegistration, for: indexPath, item: item)
          }
          return cell
      }
        return datasource
    }
    
    func applySnapshot(animatingDifferences: Bool = true) {
        var categorySnapshot = NSDiffableDataSourceSectionSnapshot<AnyHashable>()
        for (index, question) in (SavingsFAQsQuestion.listOfQuestions).enumerated(){
            categorySnapshot.append([question])
            categorySnapshot.append([SavingsFAQsAnswer.listOfAnswers[index]], to: question)
        }

        dataSource.apply(
          categorySnapshot,
          to: SavingsFAQsQuestion.Section.FAQsSection,
          animatingDifferences: false)

    }
    
}

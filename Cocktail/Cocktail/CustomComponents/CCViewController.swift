//
//  CCViewController.swift
//

import Foundation
import UIKit

class CCViewController: UIViewController {
    
    var items: Array<Any>?
    var isLoadingData = false
    
    var emptyResultsView = UIView()
    var loadingView = UIView()
    var retryView = UIView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        createEmptyResultsView()
        
        createLoagingView()
        
        createRetryView()
        
        retryLoadDataFromBackend()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if self.navigationController?.viewControllers[0] != self {
            let backArrowButton: UIButton = UIButton(type: UIButtonType.custom)
            backArrowButton.setImage(UIImage(named: "BackIcon"), for: UIControlState())
            backArrowButton.addTarget(self, action: #selector(backViewController), for: UIControlEvents.touchUpInside)
            backArrowButton.sizeToFit()
            let backButtonItem:UIBarButtonItem = UIBarButtonItem(customView: backArrowButton)
            navigationItem.leftBarButtonItem  = backButtonItem
        }
    }
    
    func backViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Initialization Methods
    func createEmptyResultsView() {
        
        emptyResultsView.backgroundColor = UIColor(rgba: Constants.Colors.primaryColor)
        view.addSubview(emptyResultsView)
        emptyResultsView.fitToSuperView()
        
        let textLabelForEmptyResult = UILabel()
        textLabelForEmptyResult.backgroundColor = UIColor.clear
        textLabelForEmptyResult.textAlignment = .center
        textLabelForEmptyResult.textColor = UIColor.white
        
        textLabelForEmptyResult.font = UIFont(name: "Avenir-Medium", size: 14)
        textLabelForEmptyResult.text = "No available Items"
        
        emptyResultsView.addSubview(textLabelForEmptyResult)
        textLabelForEmptyResult.centerToSuperView()
        
        emptyResultsView.isHidden = true
    }
    
    func createLoagingView() {
        
        loadingView.backgroundColor = UIColor(rgba: Constants.Colors.primaryColor)
        view.addSubview(loadingView)
        loadingView.fitToSuperView()
        
        let loadingIndicator = UIActivityIndicatorView()
        loadingIndicator.backgroundColor = UIColor.clear
        loadingIndicator.color = UIColor.white
        loadingIndicator.startAnimating()
        
        loadingView.addSubview(loadingIndicator)
        loadingIndicator.centerToSuperView()
        
        loadingView.isHidden = true
    }
    
    func createRetryView() {
        
        retryView.backgroundColor = UIColor(rgba: Constants.Colors.primaryColor)
        view.addSubview(retryView)
        retryView.fitToSuperView()
        
        let retryButton = UIButton()
        retryButton.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 16)
        retryButton.setTitle("Retry", for: .normal)
        retryButton.addTarget(self, action: #selector(retryLoadDataFromBackend), for: .touchUpInside)
        
        retryView.addSubview(retryButton)
        
        retryButton.setHeightLayout(height: 40.0)
        retryButton.setWidthLayout(width: 200)
        retryButton.centerToSuperView()
        
        retryView.isHidden = true
    }
    
    // MARK: - Retrieve Data Methods
    func hideAllStatusCustomViews() {
        emptyResultsView.isHidden = true
        retryView.isHidden = true
        loadingView.isHidden = true
    }
    
    func showStatusCustomView(customView: UIView) {
        
        hideAllStatusCustomViews()
        
        customView.isHidden = false
    }
    
    func retryLoadDataFromBackend() {
        
        loadDataFromBackend(callbackOk: { (data) in
            self.didLoadDataFromBackend(data: data)
        },
                            callbackError: { (errorMessage) in
                                self.isLoadingData = false
                                self.showStatusCustomView(customView: self.retryView)
        })
    }
    
    func apiEndPointCall(callbackOk: @escaping (_ data: Any?) -> Void, callbackError: @escaping (_ errorMessage: String) -> Void) {
        print("Override method: apiEndPointCall!!!")
        callbackOk(nil)
    }
    
    func loadDataFromBackend(callbackOk: @escaping (_ data: Any?) -> Void, callbackError: @escaping (_ errorMessage: String) -> Void) {
        
        if !isLoadingData{
            
            isLoadingData = true
            
            showStatusCustomView(customView: loadingView)
            
            apiEndPointCall(callbackOk: callbackOk, callbackError: callbackError)
        }
    }
    
    func didLoadDataFromBackend(data: Any?) {
        
        isLoadingData = false
        
        if (items?.count == 0) {
            showStatusCustomView(customView: emptyResultsView)
        }
        else {
            hideAllStatusCustomViews()
        }
    }
}

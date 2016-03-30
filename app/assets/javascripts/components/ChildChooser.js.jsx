class ChildChooser extends React.Component{
    constructor(props){
        super(props);
        this.state = { choosed: false };
    }

    chooseChild(child){
        this.setState({choosed: true});
        this.child = child;
    }

    render(){
        return(
            <div>
                <h3>In this section you must choose child to enroll:</h3>
                <h4>
                    <small>
                        Click on child, that you wants to enroll to this grade
                    </small>
                </h4>
                {this.renderContent()}
            </div>
        );
    }

    renderContent(){
        if(this.state.choosed){
            return this.renderResult();
        }else{
            return this.renderChilds();
        }
    }

    renderChilds(){
        return(
            this.props.childs.map((child, index) => {
                return(<ChildBlock chooseChild={ this.chooseChild.bind(this) }
                                   child={child}
                />);
            })
        );
    }
    renderResult(){
        return(
            <h4>
                <small>
                    { this.child }
                </small>
            </h4>
        );
    }
}
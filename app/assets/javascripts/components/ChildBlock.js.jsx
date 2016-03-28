class ChildBlock extends React.Component {
    constructor(props){
        super(props);
    }

    clicked(e){
        e.preventDefault();
        this.props.chooseChild(this.props.child);
    }

    render(){
        return(
            <a href="#"
               className="btn btn-default"
               onClick={ this.clicked.bind(this) }>
                <i className="fa fa-fw fa-users"/>
                {this.props.child}
            </a>
        );
    }
}
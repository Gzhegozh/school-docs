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
               className="btn btn-raised btn-default"
               onClick={ this.clicked.bind(this) }>
                <i className="fa fa-fw fa-user"/>
                {this.props.child}
            </a>
        );
    }
}